import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

/// Server-side client for the Referalli API. Keep the `rk_` key on your server.
///
/// Every operation has a typed async method named after its operationId
/// (`postLinks`, `getPartners`, ...). Writes carry an `Idempotency-Key`
/// (generated unless you pass `idempotencyKey:`) that is reused across retries.
/// Idempotent requests are retried on 429, 5xx and network errors with
/// exponential backoff and jitter, honoring `Retry-After`. Requests are pinned
/// to `ReferalliVersion.api`.
///
/// `mode: .test` (or `.live`) asserts the key's mode on every request: the API
/// refuses a request whose key is in the other mode.
public final class ReferalliClient: @unchecked Sendable {
    public static let defaultBaseURL = URL(string: "https://referalli.com")!

    /// The API key mode a client can assert.
    public enum Mode: String, Sendable {
        case test
        case live
    }

    public let apiKey: String?
    public let baseURL: URL
    /// Seconds each attempt may take.
    public let timeout: TimeInterval
    public let maxRetries: Int
    public let retryBaseDelay: TimeInterval
    public let apiVersion: String
    public let mode: Mode?
    private let session: URLSession

    public init(apiKey: String?, baseURL: URL = ReferalliClient.defaultBaseURL, timeout: TimeInterval = 30, maxRetries: Int = 3,
                retryBaseDelay: TimeInterval = 0.5, apiVersion: String = ReferalliVersion.api, mode: Mode? = nil,
                session: URLSession = .shared) {
        self.apiKey = apiKey
        self.baseURL = baseURL
        self.timeout = timeout
        self.maxRetries = maxRetries
        self.retryBaseDelay = retryBaseDelay
        self.apiVersion = apiVersion
        self.mode = mode
        self.session = session
    }

    /// A copy of this client with some settings changed: `client.withOptions(timeout: 5).getPartners()`.
    public func withOptions(timeout: TimeInterval? = nil, maxRetries: Int? = nil, retryBaseDelay: TimeInterval? = nil,
                            apiVersion: String? = nil, mode: Mode? = nil) -> ReferalliClient {
        ReferalliClient(apiKey: apiKey, baseURL: baseURL, timeout: timeout ?? self.timeout, maxRetries: maxRetries ?? self.maxRetries,
                        retryBaseDelay: retryBaseDelay ?? self.retryBaseDelay, apiVersion: apiVersion ?? self.apiVersion,
                        mode: mode ?? self.mode, session: session)
    }

    /// Methods that are safe to retry without an idempotency key.
    static let idempotentMethods: Set<String> = ["GET", "HEAD", "PUT", "DELETE", "OPTIONS"]
    /// Writes that get a generated `Idempotency-Key` when you don't pass one.
    static let keyedMethods: Set<String> = ["POST", "PATCH"]
    static let maxRetryDelay: TimeInterval = 30

    // MARK: - transport

    func send<B: Encodable, R: Decodable>(_ method: String, _ path: String, query: [(String, String?)], body: B?,
                                          idempotencyKey: String?) async throws -> R {
        let data = try await raw(method, path, query: query, body: body, idempotencyKey: idempotencyKey)
        do {
            return try JSONDecoder().decode(R.self, from: data.isEmpty ? Data("null".utf8) : data)
        } catch {
            throw ReferalliError.decoding(error)
        }
    }

    func sendText<B: Encodable>(_ method: String, _ path: String, query: [(String, String?)], body: B?,
                                idempotencyKey: String?) async throws -> String {
        String(decoding: try await raw(method, path, query: query, body: body, idempotencyKey: idempotencyKey), as: UTF8.self)
    }

    func sendEmpty<B: Encodable>(_ method: String, _ path: String, query: [(String, String?)], body: B?,
                                 idempotencyKey: String?) async throws {
        _ = try await raw(method, path, query: query, body: body, idempotencyKey: idempotencyKey)
    }

    private func raw<B: Encodable>(_ method: String, _ path: String, query: [(String, String?)], body: B?,
                                   idempotencyKey: String?) async throws -> Data {
        var urlString = baseURL.absoluteString.trimmingCharacters(in: CharacterSet(charactersIn: "/")) + path
        let pairs = query.compactMap { k, v in v.map { "\(Self.encodeComponent(k))=\(Self.encodeComponent($0))" } }
        if !pairs.isEmpty { urlString += "?" + pairs.joined(separator: "&") }
        guard let url = URL(string: urlString) else { throw ReferalliError.invalidURL(urlString) }
        var request = URLRequest(url: url, timeoutInterval: timeout)
        request.httpMethod = method
        request.setValue("application/json", forHTTPHeaderField: "accept")
        // Wire protocol: the API reads these header names.
        request.setValue(apiVersion, forHTTPHeaderField: "referalli-version")
        if let mode { request.setValue(mode.rawValue, forHTTPHeaderField: "referalli-mode") }
        request.setValue("referalli-swift/\(ReferalliVersion.sdk)", forHTTPHeaderField: "user-agent")
        if let apiKey { request.setValue("Bearer \(apiKey)", forHTTPHeaderField: "authorization") }
        if let body {
            request.httpBody = try JSONEncoder().encode(body)
            request.setValue("application/json", forHTTPHeaderField: "content-type")
        }
        let key = idempotencyKey ?? (Self.keyedMethods.contains(method) ? UUID().uuidString.lowercased() : nil)
        if let key { request.setValue(key, forHTTPHeaderField: "idempotency-key") }
        // Only idempotent requests are retried: safe methods, or writes that carry an idempotency key.
        let retryable = Self.idempotentMethods.contains(method) || key != nil

        var attempt = 0
        while true {
            let data: Data
            let response: URLResponse
            do {
                (data, response) = try await session.data(for: request)
            } catch {
                if retryable && attempt < maxRetries {
                    try await Task.sleep(nanoseconds: UInt64(delay(attempt, nil) * 1e9))
                    attempt += 1
                    continue
                }
                throw ReferalliError.connection(error)
            }
            guard let http = response as? HTTPURLResponse else { throw ReferalliError.connection(URLError(.badServerResponse)) }
            if (200..<300).contains(http.statusCode) { return data }
            let retryAfter = Self.parseRetryAfter(http.value(forHTTPHeaderField: "retry-after"))
            if [429, 500, 502, 503, 504].contains(http.statusCode) && retryable && attempt < maxRetries {
                try await Task.sleep(nanoseconds: UInt64(delay(attempt, retryAfter) * 1e9))
                attempt += 1
                continue
            }
            throw APIError.from(status: http.statusCode, data: data, response: http, retryAfter: retryAfter)
        }
    }

    /// Exponential backoff with jitter; `Retry-After` wins when the server sends it.
    private func delay(_ attempt: Int, _ retryAfter: TimeInterval?) -> TimeInterval {
        if let retryAfter { return min(max(0, retryAfter), Self.maxRetryDelay) }
        return min(retryBaseDelay * pow(2, Double(attempt)), Self.maxRetryDelay) * Double.random(in: 0.5...1.0)
    }

    private static func parseRetryAfter(_ value: String?) -> TimeInterval? {
        guard let value, !value.isEmpty else { return nil }
        if let seconds = Double(value) { return seconds }
        let f = DateFormatter()
        f.locale = Locale(identifier: "en_US_POSIX")
        f.dateFormat = "EEE, dd MMM yyyy HH:mm:ss zzz"
        return f.date(from: value).map { max(0, $0.timeIntervalSinceNow) }
    }

    func paginate<T: Sendable>(_ fetch: @escaping @Sendable (String?) async throws -> Page<T>) -> AsyncThrowingStream<T, Swift.Error> {
        AsyncThrowingStream { continuation in
            let task = Task {
                do {
                    var cursor: String?
                    while true {
                        let page = try await fetch(cursor)
                        for item in page.data { continuation.yield(item) }
                        guard page.hasMore, let next = page.nextCursor, !next.isEmpty else { break }
                        cursor = next
                    }
                    continuation.finish()
                } catch {
                    continuation.finish(throwing: error)
                }
            }
            continuation.onTermination = { _ in task.cancel() }
        }
    }

    /// Every item of a list operation (by id), following `next_cursor`.
    public func listAll(_ operationId: String, path: [String: String] = [:], query: [String: JSONValue] = [:]) async throws -> [JSONValue] {
        var q = query
        var items: [JSONValue] = []
        while true {
            let page = try await call(operationId, path: path, query: q)
            guard case let .object(fields) = page, case let .array(data)? = fields["data"] else { return items }
            items.append(contentsOf: data)
            guard case .bool(true)? = fields["has_more"], case let .string(next)? = fields["next_cursor"], !next.isEmpty else { return items }
            q["starting_after"] = .string(next)
        }
    }

    // MARK: - helpers used by the generated code

    static func segment(_ value: String) -> String { encodeComponent(value) }

    static func encodeComponent(_ value: String) -> String {
        var allowed = CharacterSet.alphanumerics
        allowed.insert(charactersIn: "-._~")
        return value.addingPercentEncoding(withAllowedCharacters: allowed) ?? value
    }

    static func queryString(_ value: String?) -> String? { value }
    static func queryString(_ value: Int?) -> String? { value.map(String.init) }
    static func queryString(_ value: Double?) -> String? { value.map { String($0) } }
    static func queryString(_ value: Bool?) -> String? { value.map { $0 ? "true" : "false" } }

    static func queryString(_ value: JSONValue?) -> String? {
        switch value {
        case .string(let s)?: return s
        case .number(let n)?: return n.rounded() == n ? String(Int(n)) : String(n)
        case .bool(let b)?: return b ? "true" : "false"
        default: return nil
        }
    }
    static func queryInt(_ value: JSONValue?) -> Int? {
        switch value {
        case .number(let n)?: return Int(n)
        case .string(let s)?: return Int(s)
        default: return nil
        }
    }
    static func queryDouble(_ value: JSONValue?) -> Double? {
        switch value {
        case .number(let n)?: return n
        case .string(let s)?: return Double(s)
        default: return nil
        }
    }
    static func queryBool(_ value: JSONValue?) -> Bool? {
        switch value {
        case .bool(let b)?: return b
        case .string(let s)?: return s == "true"
        default: return nil
        }
    }
    static func decode<T: Decodable>(_ type: T.Type, from value: JSONValue) throws -> T {
        try JSONDecoder().decode(T.self, from: JSONEncoder().encode(value))
    }
    static func encode<T: Encodable>(_ value: T) throws -> JSONValue {
        try JSONDecoder().decode(JSONValue.self, from: JSONEncoder().encode(value))
    }
}

/// A request without a body.
public struct NoBody: Encodable, Sendable {}

/// One page of a list: pass `nextCursor` as `startingAfter` for the next.
public struct Page<T: Codable & Sendable>: Codable, Sendable {
    public var object: String
    public var data: [T]
    public var hasMore: Bool
    public var nextCursor: String?

    enum CodingKeys: String, CodingKey {
        case object, data
        case hasMore = "has_more"
        case nextCursor = "next_cursor"
    }
}

extension Page: Equatable where T: Equatable {}

/// Errors raised by the SDK itself (not the API).
public enum ReferalliError: Swift.Error, @unchecked Sendable {
    /// The API could not be reached (network error or timeout), after retries.
    case connection(Swift.Error)
    case decoding(Swift.Error)
    case invalidURL(String)
    case unknownOperation(String)
    /// A webhook delivery failed signature or timestamp verification, or isn't a JSON event.
    case webhookVerification(String)
}

/// The API answered with an error. `code` is stable; `docsUrl` explains it.
/// Each documented code has its own subclass (`NotFoundError`, …).
public class APIError: Swift.Error, CustomStringConvertible, @unchecked Sendable {
    public let status: Int
    public let code: String
    public let message: String
    public let requestId: String?
    public let docsUrl: String?
    public let details: JSONValue?
    public let retryAfter: TimeInterval?

    public required init(status: Int, code: String, message: String, requestId: String?, docsUrl: String?, details: JSONValue?,
                         retryAfter: TimeInterval?) {
        self.status = status
        self.code = code
        self.message = message
        self.requestId = requestId
        self.docsUrl = docsUrl
        self.details = details
        self.retryAfter = retryAfter
    }

    public var description: String { "\(code) (\(status)): \(message)" }

    static func from(status: Int, data: Data, response: HTTPURLResponse, retryAfter: TimeInterval?) -> APIError {
        struct Envelope: Decodable {
            struct Body: Decodable {
                let code: String?
                let message: String?
                let requestId: String?
                let docs_url: String?
                let details: JSONValue?
            }
            let error: Body?
        }
        let body = (try? JSONDecoder().decode(Envelope.self, from: data))?.error
        let code = body?.code ?? "http_error"
        let type = classes[code] ?? APIError.self
        return type.init(status: status, code: code, message: body?.message ?? String(decoding: data, as: UTF8.self),
                         requestId: body?.requestId ?? response.value(forHTTPHeaderField: "x-request-id"),
                         docsUrl: body?.docs_url, details: body?.details, retryAfter: retryAfter)
    }
}

/// Boxes a value so mutually recursive models can hold each other.
public final class Indirect<T: Codable & Sendable & Equatable>: Codable, Sendable, Equatable {
    public let value: T
    public init(_ value: T) { self.value = value }
    public required init(from decoder: Decoder) throws { value = try T(from: decoder) }
    public func encode(to encoder: Encoder) throws { try value.encode(to: encoder) }
    public static func == (a: Indirect, b: Indirect) -> Bool { a.value == b.value }
}
