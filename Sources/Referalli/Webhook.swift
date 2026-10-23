import Foundation
#if canImport(CryptoKit)
import CryptoKit
#elseif canImport(Crypto)
import Crypto
#endif

/// A webhook delivery: the envelope every topic shares, plus its payload typed by topic.
public struct WebhookEvent: Sendable {
    public let id: String
    public let topic: String
    public let orgId: String?
    public let livemode: Bool
    public let createdAt: String?
    /// The raw payload.
    public let data: JSONValue
    /// The payload decoded as its topic's type (`.unknown` for a topic this SDK predates).
    public let payload: WebhookPayload
}

/// Verifies and parses Referalli webhook deliveries (Standard Webhooks signatures).
///
/// The signature is `v1,` + base64 HMAC-SHA256 of `{webhook-id}.{webhook-timestamp}.{raw body}`,
/// keyed with the base64 after `whsec_`. It is compared in constant time, and deliveries more
/// than `toleranceSec` (default 300) from now, in either direction, are rejected.
public enum ReferalliWebhook {
    public static let toleranceSec: TimeInterval = 300

    /// True when `rawBody` (exactly as received) was signed with one of `secrets` within the
    /// tolerance. `headers` may use any case. Pass two secrets while you rotate one.
    public static func verify(rawBody: Data, headers: [String: String], secrets: [String], now: Date = Date(),
                              toleranceSec: TimeInterval = toleranceSec) -> Bool {
        problem(rawBody: rawBody, headers: headers, secrets: secrets, now: now, toleranceSec: toleranceSec) == nil
    }

    /// Verifies a delivery and returns its event, typed by topic.
    /// Throws `ReferalliError.webhookVerification` when the signature, timestamp or body is bad.
    public static func constructEvent(rawBody: Data, headers: [String: String], secrets: [String], now: Date = Date(),
                                      toleranceSec: TimeInterval = toleranceSec) throws -> WebhookEvent {
        if let why = problem(rawBody: rawBody, headers: headers, secrets: secrets, now: now, toleranceSec: toleranceSec) {
            throw ReferalliError.webhookVerification(why)
        }
        guard let json = try? JSONDecoder().decode(JSONValue.self, from: rawBody), case let .object(fields) = json,
              case let .string(topic)? = fields["topic"] else {
            throw ReferalliError.webhookVerification("the body is not a webhook event")
        }
        func string(_ key: String) -> String? {
            if case let .string(s)? = fields[key] { return s }
            return nil
        }
        var livemode = true
        if case let .bool(b)? = fields["livemode"] { livemode = b }
        let data = fields["data"] ?? .null
        let payload: WebhookPayload
        do {
            payload = try WebhookPayload.decode(topic: topic, data: data)
        } catch {
            payload = .unknown(topic: topic, data: data)
        }
        return WebhookEvent(id: string("id") ?? "", topic: topic, orgId: string("orgId"), livemode: livemode,
                            createdAt: string("createdAt"), data: data, payload: payload)
    }

    static func problem(rawBody: Data, headers: [String: String], secrets: [String], now: Date, toleranceSec: TimeInterval) -> String? {
        let lower = Dictionary(headers.map { ($0.key.lowercased(), $0.value) }, uniquingKeysWith: { a, _ in a })
        guard let id = lower["webhook-id"], let ts = lower["webhook-timestamp"], let sig = lower["webhook-signature"],
              !id.isEmpty, !ts.isEmpty, !sig.isEmpty else {
            return "missing webhook-id, webhook-timestamp or webhook-signature header"
        }
        guard ts.allSatisfy({ $0 >= "0" && $0 <= "9" }), let seconds = Int(ts) else {
            return "webhook-timestamp is not a unix timestamp"
        }
        guard abs(now.timeIntervalSince1970 - Double(seconds)) <= toleranceSec else {
            return "webhook-timestamp is outside the tolerance (replayed or clock skew)"
        }
        #if canImport(CryptoKit) || canImport(Crypto)
        let provided = sig.split(separator: " ").map(String.init).filter { $0.hasPrefix("v1,") }
        var message = Data("\(id).\(ts).".utf8)
        message.append(rawBody)
        for secret in secrets {
            let keyData = secret.hasPrefix("whsec_") ? (Data(base64Encoded: String(secret.dropFirst(6))) ?? Data(secret.utf8)) : Data(secret.utf8)
            let mac = HMAC<SHA256>.authenticationCode(for: message, using: SymmetricKey(data: keyData))
            let expected = "v1," + Data(mac).base64EncodedString()
            if provided.contains(where: { constantTimeEqual($0, expected) }) { return nil }
        }
        return "no signature matches the secret"
        #else
        return "no HMAC implementation (CryptoKit or swift-crypto) is available"
        #endif
    }

    private static func constantTimeEqual(_ a: String, _ b: String) -> Bool {
        let x = Array(a.utf8), y = Array(b.utf8)
        guard x.count == y.count else { return false }
        var diff: UInt8 = 0
        for i in 0..<x.count { diff |= x[i] ^ y[i] }
        return diff == 0
    }
}
