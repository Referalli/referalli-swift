// Referalli app attribution for iOS, iPadOS, macOS, tvOS and watchOS (Foundation only).
//
//   // App launch (AppDelegate / @main App init):
//   Referalli.configure(publishableKey: "tk_…", programId: "prg_…")
//
//   // Universal links / custom-scheme links (SwiftUI: .onOpenURL { Referalli.handle(url: $0) }):
//   Referalli.handle(url: url)
//   Referalli.handle(userActivity: activity)
//
//   // First open after install: the referral from the link, or a deferred match.
//   let referral = await Referalli.getReferral()   // nil when not referred
//
//   // After the user signs up:
//   let result = try await Referalli.trackSignup(customerRef: user.id)
//
// Privacy: no IDFA, no IDFV, no clipboard access, no AppTrackingTransparency.
// The SDK keeps a random install id (anonId) in UserDefaults. Deferred
// resolution asks the API to match this device's IP address against a recent
// link click (see ATTRIBUTION.md, "Privacy and App Tracking Transparency"); turn it off
// with `deferredResolution: false` and call `Referalli.resolveDeferred()` when
// your policy allows it.
//
// In-app purchases are reported from your backend (POST /v1/mobile/purchases
// with a secret API key, after validating the receipt), never from the app.

import Foundation

// MARK: - Public types

/// How the referral was captured.
public struct ReferalliReferral: Codable, Equatable, Sendable {
    public enum Source: String, Codable, Sendable {
        /// The app was opened from a referral link (universal link or custom scheme).
        case link
        /// First open after install, matched by the API (`/mobile/resolve`).
        case deferred
        /// Play Install Referrer (Android only; kept for parity of stored values).
        case installReferrer
        /// Set by the app via `Referalli.setReferral(code:)`.
        case manual
    }

    /// The click id (`ref_click_id`). Deterministic attribution when present.
    public var clickId: String?
    /// The partner's referral code (`via`).
    public var code: String?
    /// Where the link wanted to send the user (deferred matches only).
    public var destination: String?
    /// The program the click belongs to, when the API reports it.
    public var programId: String?
    public var source: Source
    public var capturedAt: Date

    public init(clickId: String? = nil, code: String? = nil, destination: String? = nil,
                programId: String? = nil, source: Source, capturedAt: Date = Date()) {
        self.clickId = clickId
        self.code = code
        self.destination = destination
        self.programId = programId
        self.source = source
        // Whole milliseconds, so a stored referral compares equal to the one that was captured.
        self.capturedAt = Date(timeIntervalSince1970: Double(Self.milliseconds(capturedAt)) / 1000)
    }

    static func milliseconds(_ date: Date) -> Int64 { Int64((date.timeIntervalSince1970 * 1000).rounded()) }
}

/// The outcome of `trackSignup`.
public struct ReferalliSignupResult: Equatable, Sendable {
    /// True when the API attributed this customer to a partner.
    public let attributed: Bool
    public let referralId: String?
    public let partnerId: String?

    public init(attributed: Bool, referralId: String?, partnerId: String?) {
        self.attributed = attributed
        self.referralId = referralId
        self.partnerId = partnerId
    }
}

public enum ReferalliTrackerError: Error, Equatable, Sendable {
    /// `Referalli.configure(publishableKey:)` was not called.
    case notConfigured
    /// The API answered with a non-2xx status.
    case http(status: Int)
    /// The request could not be sent or the response could not be read.
    case transport(String)
    case invalidResponse
}

/// The HTTP seam. The default uses `URLSession`; tests and custom stacks supply their own.
public protocol ReferalliTransport: Sendable {
    func send(_ request: URLRequest) async throws -> (Data, HTTPURLResponse)
}

public struct URLSessionReferalliTransport: ReferalliTransport {
    private let session: URLSession
    public init(session: URLSession = .shared) { self.session = session }

    public func send(_ request: URLRequest) async throws -> (Data, HTTPURLResponse) {
        let (data, response) = try await session.data(for: request)
        guard let http = response as? HTTPURLResponse else { throw ReferalliTrackerError.invalidResponse }
        return (data, http)
    }
}

// MARK: - Locking

/// State behind a lock that is only ever taken in synchronous code, never across an `await`, so
/// it is valid under Swift 6 strict concurrency. (`Mutex` needs iOS 18 / macOS 15 and
/// `OSAllocatedUnfairLock` iOS 16 / macOS 13; this package supports iOS 15 / macOS 12.)
final class ReferalliProtected<State>: @unchecked Sendable {
    private var state: State
    private let lock = NSLock()

    init(_ state: State) { self.state = state }

    func withLock<R>(_ body: (inout State) throws -> R) rethrows -> R {
        lock.lock()
        defer { lock.unlock() }
        return try body(&state)
    }
}

/// Persistence for the install id, the captured referral and the first-open flag.
/// Called from any thread; implementations must be thread-safe.
public protocol ReferalliKeyValueStore: AnyObject, Sendable {
    func string(forKey key: String) -> String?
    func set(_ value: String?, forKey key: String)
}

/// The default store: `UserDefaults.standard` (or an app-group suite).
public final class ReferalliUserDefaultsStore: ReferalliKeyValueStore, @unchecked Sendable { // UserDefaults is thread-safe
    private let defaults: UserDefaults
    public init(defaults: UserDefaults = .standard) { self.defaults = defaults }
    public func string(forKey key: String) -> String? { defaults.string(forKey: key) }
    public func set(_ value: String?, forKey key: String) {
        if let value { defaults.set(value, forKey: key) } else { defaults.removeObject(forKey: key) }
    }
}

public final class ReferalliMemoryStore: ReferalliKeyValueStore, Sendable {
    private let values = ReferalliProtected<[String: String]>([:])
    public init() {}
    public func string(forKey key: String) -> String? { values.withLock { $0[key] } }
    public func set(_ value: String?, forKey key: String) { values.withLock { $0[key] = value } }
}

// MARK: - Tracker

public final class ReferalliTracker: Sendable {
    public static let defaultBaseURL = URL(string: "https://referalli.com")!

    /// The org's public tracking token (Settings → Tracking). Safe to ship in an app.
    public let publishableKey: String
    public let programId: String?
    public let baseURL: URL
    /// When false, `getReferral()` never calls the deferred resolver on its own.
    public let deferredResolution: Bool

    private let store: ReferalliKeyValueStore
    private let transport: ReferalliTransport
    /// Guards the store's read-modify-write sequences and the in-flight deferred lookup.
    private let state = ReferalliProtected<Task<ReferalliReferral?, Never>?>(nil)

    static let anonKey = "referalli.anon_id"
    static let referralKey = "referalli.referral"
    static let firstOpenKey = "referalli.first_open_done"

    public init(publishableKey: String, programId: String? = nil,
                baseURL: URL = ReferalliTracker.defaultBaseURL, deferredResolution: Bool = true,
                store: ReferalliKeyValueStore = ReferalliUserDefaultsStore(),
                transport: ReferalliTransport = URLSessionReferalliTransport()) {
        self.publishableKey = publishableKey
        self.programId = programId
        self.baseURL = baseURL
        self.deferredResolution = deferredResolution
        self.store = store
        self.transport = transport
    }

    /// Random install id, persisted across launches. Not derived from the device.
    public var anonId: String {
        locked {
            if let existing = store.string(forKey: Self.anonKey) { return existing }
            let fresh = "a_" + String(UUID().uuidString.replacingOccurrences(of: "-", with: "").lowercased().prefix(20))
            store.set(fresh, forKey: Self.anonKey)
            return fresh
        }
    }

    /// The stored referral, if one was captured. Does not hit the network.
    public var referral: ReferalliReferral? { locked { loadReferral() } }

    // MARK: Links

    /// Captures a referral from a universal link or custom-scheme URL. Returns nil (and keeps any
    /// earlier referral) when the URL carries no referral. Also reports the visit to the API.
    @discardableResult
    public func handle(url: URL) -> ReferalliReferral? {
        guard let captured = Self.parse(url: url) else { return nil }
        locked {
            saveReferral(captured)
            store.set("1", forKey: Self.firstOpenKey) // a link open is better evidence than a fingerprint
        }
        let anon = anonId
        Task { [weak self] in
            guard let self else { return }
            // A /go short link opened the app directly, so no click exists yet: the visit records it.
            guard let clickId = try? await self.trackVisit(code: captured.code, clickId: captured.clickId,
                                                            url: url.absoluteString, anonId: anon),
                  captured.clickId == nil else { return }
            var updated = captured
            updated.clickId = clickId
            self.locked {
                if self.loadReferral()?.capturedAt == captured.capturedAt { self.saveReferral(updated) }
            }
        }
        return captured
    }

    /// Universal links arrive as `NSUserActivityTypeBrowsingWeb` activities.
    @discardableResult
    public func handle(userActivity: NSUserActivity) -> ReferalliReferral? {
        guard userActivity.activityType == NSUserActivityTypeBrowsingWeb, let url = userActivity.webpageURL else {
            return nil
        }
        return handle(url: url)
    }

    /// Sets the referral from a code the user typed (e.g. an invite code field).
    @discardableResult
    public func setReferral(code: String) -> ReferalliReferral {
        let referral = ReferalliReferral(code: code, source: .manual)
        locked {
            saveReferral(referral)
            store.set("1", forKey: Self.firstOpenKey)
        }
        let anon = anonId
        Task { [weak self] in _ = try? await self?.trackVisit(code: code, anonId: anon) }
        return referral
    }

    /// Extracts `ref_click_id` and `via` (or `ref`), or the code of a `/go/<token>/<code>` short link.
    public static func parse(url: URL) -> ReferalliReferral? {
        let items = URLComponents(url: url, resolvingAgainstBaseURL: false)?.queryItems ?? []
        func value(_ name: String) -> String? {
            items.first { $0.name == name }?.value.flatMap { $0.isEmpty ? nil : $0 }
        }
        let clickId = value("ref_click_id")
        var code = value("via") ?? value("ref")
        let parts = url.path.split(separator: "/").map(String.init)
        if code == nil, parts.count == 3, parts[0] == "go" { code = parts[2] }
        guard clickId != nil || code != nil else { return nil }
        return ReferalliReferral(clickId: clickId, code: code, source: .link)
    }

    // MARK: Referral lookup

    /// The referral for this install: the stored one, or (first open only, when
    /// `deferredResolution` is on) a deferred match from the API. Never throws;
    /// network failures return nil and the lookup is retried on the next call.
    public func getReferral() async -> ReferalliReferral? {
        if let stored = referral { return stored }
        guard deferredResolution else { return nil }
        return await resolveDeferred()
    }

    /// Runs the deferred resolver once per install (call it yourself when
    /// `deferredResolution` is off, e.g. after your consent prompt).
    public func resolveDeferred() async -> ReferalliReferral? {
        enum Step { case done(ReferalliReferral?), wait(Task<ReferalliReferral?, Never>) }
        let step: Step = state.withLock { inflight in
            if let stored = loadReferral() { return .done(stored) }
            if store.string(forKey: Self.firstOpenKey) != nil { return .done(nil) }
            if let running = inflight { return .wait(running) }
            // The task's own withLock waits until this one returns, so it cannot clear too early.
            let task = Task<ReferalliReferral?, Never> { [weak self] in
                guard let self else { return nil }
                let found = await self.performResolve()
                self.state.withLock { $0 = nil }
                return found
            }
            inflight = task
            return .wait(task)
        }
        switch step {
        case .done(let value): return value
        case .wait(let task): return await task.value
        }
    }

    private func performResolve() async -> ReferalliReferral? {
        struct Resolve: Decodable {
            let matched: Bool
            let clickId: String?
            let code: String?
            let destination: String?
            let programId: String?
        }
        guard let data = try? await request("GET", "/t/\(publishableKey)/mobile/resolve", body: nil),
              let match = try? JSONDecoder().decode(Resolve.self, from: data) else {
            return nil // retry on the next launch
        }
        locked { store.set("1", forKey: Self.firstOpenKey) }
        guard match.matched, match.clickId != nil || match.code != nil else { return nil }
        let found = ReferalliReferral(clickId: match.clickId, code: match.code, destination: match.destination,
                                      programId: match.programId, source: .deferred)
        locked { saveReferral(found) }
        // Tie the install id to the click so identify-based attribution works too.
        _ = try? await trackVisit(clickId: match.clickId, anonId: anonId)
        return found
    }

    // MARK: Events

    /// Reports a signup: links the install to `customerRef` and, when a program is
    /// known, asks the API to attribute the customer (`/mobile/install`).
    @discardableResult
    public func trackSignup(customerRef: String, emailHash: String? = nil) async throws -> ReferalliSignupResult {
        let current = await getReferral()
        try await identify(customerRef: customerRef, emailHash: emailHash)
        guard let program = programId ?? current?.programId else {
            // Without a program id only the identify link is recorded (see ATTRIBUTION.md).
            return ReferalliSignupResult(attributed: false, referralId: nil, partnerId: nil)
        }
        var body: [String: String] = ["programId": program, "customerRef": customerRef, "deviceId": anonId]
        if let clickId = current?.clickId { body["clickId"] = clickId }
        struct Install: Decodable { let attributed: Bool; let referralId: String?; let partnerId: String? }
        let data = try await request("POST", "/t/\(publishableKey)/mobile/install", body: body)
        guard let install = try? JSONDecoder().decode(Install.self, from: data) else {
            throw ReferalliTrackerError.invalidResponse
        }
        return ReferalliSignupResult(attributed: install.attributed, referralId: install.referralId,
                                     partnerId: install.partnerId)
    }

    /// Reports an app visit. Returns the click id the API recorded or echoed, if any.
    @discardableResult
    public func trackVisit(code: String? = nil, clickId: String? = nil, url: String? = nil) async throws -> String? {
        try await trackVisit(code: code, clickId: clickId, url: url, anonId: anonId)
    }

    /// Ties the install to a signed-up customer (or a hashed email).
    public func identify(customerRef: String? = nil, emailHash: String? = nil) async throws {
        var body: [String: String] = ["anonId": anonId]
        if let customerRef { body["customerRef"] = customerRef }
        if let emailHash { body["emailHash"] = emailHash }
        _ = try await request("POST", "/t/\(publishableKey)/identify", body: body)
    }

    /// Forgets the install id, the referral and the first-open flag (e.g. on logout in a shared-device app).
    public func reset() {
        locked {
            for key in [Self.anonKey, Self.referralKey, Self.firstOpenKey] { store.set(nil, forKey: key) }
        }
    }

    // MARK: Internals

    private func trackVisit(code: String? = nil, clickId: String? = nil, url: String? = nil,
                            anonId: String) async throws -> String? {
        var body: [String: String] = ["anonId": anonId]
        if let code { body["code"] = code }
        if let clickId { body["clickId"] = clickId }
        if let url { body["url"] = String(url.prefix(2048)) }
        let data = try await request("POST", "/t/\(publishableKey)/visit", body: body)
        struct Visit: Decodable { let clickId: String? }
        return (try? JSONDecoder().decode(Visit.self, from: data))?.clickId ?? clickId
    }

    private func request(_ method: String, _ path: String, body: [String: String]?) async throws -> Data {
        guard let url = URL(string: path, relativeTo: baseURL) else { throw ReferalliTrackerError.invalidResponse }
        var request = URLRequest(url: url, timeoutInterval: 10)
        request.httpMethod = method
        request.setValue("application/json", forHTTPHeaderField: "accept")
        if let body {
            request.httpBody = try JSONSerialization.data(withJSONObject: body, options: [.sortedKeys])
            request.setValue("application/json", forHTTPHeaderField: "content-type")
        }
        let data: Data
        let response: HTTPURLResponse
        do {
            (data, response) = try await transport.send(request)
        } catch let error as ReferalliTrackerError {
            throw error
        } catch {
            throw ReferalliTrackerError.transport(String(describing: error))
        }
        guard (200..<300).contains(response.statusCode) else {
            throw ReferalliTrackerError.http(status: response.statusCode)
        }
        return data
    }

    /// Runs `body` under the state lock. Synchronous: never spans an `await`.
    private func locked<T>(_ body: () -> T) -> T {
        state.withLock { _ in body() }
    }

    // Callers hold the state lock.
    private func loadReferral() -> ReferalliReferral? {
        guard let raw = store.string(forKey: Self.referralKey), let data = raw.data(using: .utf8) else { return nil }
        return try? Self.decoder.decode(ReferalliReferral.self, from: data)
    }

    private func saveReferral(_ referral: ReferalliReferral) {
        guard let data = try? Self.encoder.encode(referral) else { return }
        store.set(String(decoding: data, as: UTF8.self), forKey: Self.referralKey)
    }

    // Fresh coders per use: JSONEncoder/JSONDecoder are not Sendable on every SDK this supports.
    private static var encoder: JSONEncoder {
        let e = JSONEncoder()
        e.dateEncodingStrategy = .custom { date, encoder in
            var c = encoder.singleValueContainer()
            try c.encode(ReferalliReferral.milliseconds(date))
        }
        return e
    }
    private static var decoder: JSONDecoder {
        let d = JSONDecoder()
        d.dateDecodingStrategy = .custom { decoder in
            Date(timeIntervalSince1970: Double(try decoder.singleValueContainer().decode(Int64.self)) / 1000)
        }
        return d
    }
}

// MARK: - Completion-handler variants (Objective-C style call sites)

extension ReferalliTracker {
    public func getReferral(completion: @escaping @Sendable (ReferalliReferral?) -> Void) {
        Task { completion(await getReferral()) }
    }

    public func trackSignup(customerRef: String, emailHash: String? = nil,
                            completion: @escaping @Sendable (Result<ReferalliSignupResult, Error>) -> Void) {
        Task {
            do { completion(.success(try await trackSignup(customerRef: customerRef, emailHash: emailHash))) }
            catch { completion(.failure(error)) }
        }
    }
}

// MARK: - Facade

/// The app-wide entry point. Call `configure` once at launch.
public enum Referalli {
    private static let current = ReferalliProtected<ReferalliTracker?>(nil)

    /// The configured tracker, or nil before `configure`.
    public static var shared: ReferalliTracker? {
        current.withLock { $0 }
    }

    /// - Parameters:
    ///   - publishableKey: your org's public tracking token (Settings → Tracking).
    ///   - programId: the program installs belong to; needed for `trackSignup` to attribute.
    ///   - deferredResolution: match the first open to a recent link click via the API.
    @discardableResult
    public static func configure(publishableKey: String, programId: String? = nil,
                                 baseURL: URL = ReferalliTracker.defaultBaseURL,
                                 deferredResolution: Bool = true,
                                 store: ReferalliKeyValueStore = ReferalliUserDefaultsStore(),
                                 transport: ReferalliTransport = URLSessionReferalliTransport()) -> ReferalliTracker {
        let tracker = ReferalliTracker(publishableKey: publishableKey, programId: programId, baseURL: baseURL,
                                       deferredResolution: deferredResolution, store: store, transport: transport)
        current.withLock { $0 = tracker }
        return tracker
    }

    @discardableResult
    public static func handle(url: URL) -> ReferalliReferral? { shared?.handle(url: url) }

    @discardableResult
    public static func handle(userActivity: NSUserActivity) -> ReferalliReferral? {
        shared?.handle(userActivity: userActivity)
    }

    @discardableResult
    public static func setReferral(code: String) -> ReferalliReferral? { shared?.setReferral(code: code) }

    public static func getReferral() async -> ReferalliReferral? { await shared?.getReferral() }

    public static func getReferral(completion: @escaping @Sendable (ReferalliReferral?) -> Void) {
        guard let tracker = shared else { return completion(nil) }
        tracker.getReferral(completion: completion)
    }

    public static func resolveDeferred() async -> ReferalliReferral? { await shared?.resolveDeferred() }

    @discardableResult
    public static func trackSignup(customerRef: String, emailHash: String? = nil) async throws -> ReferalliSignupResult {
        guard let tracker = shared else { throw ReferalliTrackerError.notConfigured }
        return try await tracker.trackSignup(customerRef: customerRef, emailHash: emailHash)
    }

    public static func trackSignup(customerRef: String, emailHash: String? = nil,
                                   completion: @escaping @Sendable (Result<ReferalliSignupResult, Error>) -> Void) {
        guard let tracker = shared else { return completion(.failure(ReferalliTrackerError.notConfigured)) }
        tracker.trackSignup(customerRef: customerRef, emailHash: emailHash, completion: completion)
    }
}
