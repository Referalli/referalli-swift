import Foundation
import XCTest
@testable import Referalli

/// Records requests and answers from a per-path table.
final class StubTransport: ReferalliTransport, @unchecked Sendable {
    private let lock = NSLock()
    private var responses: [String: (Int, String)]
    private(set) var requests: [URLRequest] = []

    init(_ responses: [String: (Int, String)]) { self.responses = responses }

    func send(_ request: URLRequest) async throws -> (Data, HTTPURLResponse) {
        let path = request.url!.path
        let answer: (Int, String) = record(request, path)
        let response = HTTPURLResponse(url: request.url!, statusCode: answer.0, httpVersion: nil, headerFields: nil)!
        return (Data(answer.1.utf8), response)
    }

    private func record(_ request: URLRequest, _ path: String) -> (Int, String) {
        lock.lock(); defer { lock.unlock() }
        requests.append(request)
        return responses.first { path.hasSuffix($0.key) }?.value ?? (404, "{}")
    }

    func paths() -> [String] {
        lock.lock(); defer { lock.unlock() }
        return requests.map { "\($0.httpMethod ?? "") \($0.url!.path)" }
    }

    func body(of suffix: String) -> [String: String]? {
        lock.lock(); defer { lock.unlock() }
        guard let req = requests.last(where: { $0.url!.path.hasSuffix(suffix) }), let data = req.httpBody else { return nil }
        return try? JSONSerialization.jsonObject(with: data) as? [String: String]
    }
}

final class TrackerTests: XCTestCase {
    private func tracker(_ transport: StubTransport, programId: String? = "prg_1",
                         deferred: Bool = true, store: ReferalliMemoryStore = ReferalliMemoryStore()) -> ReferalliTracker {
        ReferalliTracker(publishableKey: "tk_test", programId: programId,
                         baseURL: URL(string: "https://api.example")!, deferredResolution: deferred,
                         store: store, transport: transport)
    }

    func testParsesClickIdAndCodeFromUniversalLink() {
        let ref = ReferalliTracker.parse(url: URL(string: "https://app.example/welcome?via=dana&ref_click_id=clk_9")!)
        XCTAssertEqual(ref?.code, "dana")
        XCTAssertEqual(ref?.clickId, "clk_9")
        XCTAssertEqual(ref?.source, .link)
    }

    func testParsesGoShortLinkPath() {
        let ref = ReferalliTracker.parse(url: URL(string: "https://referalli.com/go/tk_test/dana")!)
        XCTAssertEqual(ref?.code, "dana")
        XCTAssertNil(ref?.clickId)
    }

    func testIgnoresLinksWithoutReferral() {
        XCTAssertNil(ReferalliTracker.parse(url: URL(string: "https://app.example/settings?tab=1")!))
    }

    func testAnonIdIsStable() {
        let store = ReferalliMemoryStore()
        let a = tracker(StubTransport([:]), store: store).anonId
        let b = tracker(StubTransport([:]), store: store).anonId
        XCTAssertEqual(a, b)
        XCTAssertTrue(a.hasPrefix("a_"))
    }

    func testDeferredResolutionRunsOncePerInstall() async {
        let transport = StubTransport([
            "/mobile/resolve": (200, #"{"matched":true,"clickId":"clk_1","code":"dana","destination":"https://app.example/w"}"#),
            "/visit": (200, #"{"ok":true,"clickId":"clk_1"}"#),
        ])
        let t = tracker(transport)
        let first = await t.getReferral()
        XCTAssertEqual(first?.clickId, "clk_1")
        XCTAssertEqual(first?.source, .deferred)
        XCTAssertEqual(first?.destination, "https://app.example/w")
        let again = await t.getReferral()
        XCTAssertEqual(again, first)
        XCTAssertEqual(transport.paths().filter { $0.hasSuffix("/mobile/resolve") }.count, 1)
    }

    func testUnmatchedResolveIsNotRetried() async {
        let transport = StubTransport(["/mobile/resolve": (200, #"{"matched":false}"#)])
        let t = tracker(transport)
        let first = await t.getReferral()
        let second = await t.getReferral()
        XCTAssertNil(first)
        XCTAssertNil(second)
        XCTAssertEqual(transport.paths().count, 1)
    }

    func testNetworkFailureRetriesNextTime() async {
        let transport = StubTransport(["/mobile/resolve": (503, "{}")])
        let t = tracker(transport)
        let first = await t.getReferral()
        let second = await t.getReferral()
        XCTAssertNil(first)
        XCTAssertNil(second)
        XCTAssertEqual(transport.paths().count, 2)
    }

    func testDeferredResolutionOffSkipsNetwork() async {
        let transport = StubTransport([:])
        let ref = await tracker(transport, deferred: false).getReferral()
        XCTAssertNil(ref)
        XCTAssertTrue(transport.paths().isEmpty)
    }

    func testLinkWinsOverDeferredResolution() async {
        let transport = StubTransport(["/visit": (200, #"{"ok":true,"clickId":"clk_7"}"#)])
        let t = tracker(transport)
        t.handle(url: URL(string: "https://app.example/?via=dana&ref_click_id=clk_7")!)
        let ref = await t.getReferral()
        XCTAssertEqual(ref?.clickId, "clk_7")
        XCTAssertFalse(transport.paths().contains { $0.hasSuffix("/mobile/resolve") })
    }

    func testTrackSignupIdentifiesAndAttributes() async throws {
        let transport = StubTransport([
            "/mobile/resolve": (200, #"{"matched":true,"clickId":"clk_1","code":"dana","destination":"x"}"#),
            "/visit": (200, #"{"ok":true,"clickId":"clk_1"}"#),
            "/identify": (200, #"{"ok":true}"#),
            "/mobile/install": (200, #"{"attributed":true,"referralId":"ref_1","partnerId":"ptr_1"}"#),
        ])
        let t = tracker(transport)
        let result = try await t.trackSignup(customerRef: "cus_42")
        XCTAssertEqual(result, ReferalliSignupResult(attributed: true, referralId: "ref_1", partnerId: "ptr_1"))
        XCTAssertEqual(transport.body(of: "/identify")?["customerRef"], "cus_42")
        let install = transport.body(of: "/mobile/install")
        XCTAssertEqual(install?["programId"], "prg_1")
        XCTAssertEqual(install?["clickId"], "clk_1")
        XCTAssertEqual(install?["deviceId"], t.anonId)
    }

    func testTrackSignupWithoutProgramOnlyIdentifies() async throws {
        let transport = StubTransport([
            "/mobile/resolve": (200, #"{"matched":false}"#),
            "/identify": (200, #"{"ok":true}"#),
        ])
        let result = try await tracker(transport, programId: nil).trackSignup(customerRef: "cus_1")
        XCTAssertFalse(result.attributed)
        XCTAssertFalse(transport.paths().contains { $0.hasSuffix("/mobile/install") })
    }

    func testTrackSignupSurfacesHttpErrors() async {
        let transport = StubTransport(["/mobile/resolve": (200, #"{"matched":false}"#), "/identify": (400, "{}")])
        do {
            _ = try await tracker(transport).trackSignup(customerRef: "cus_1")
            XCTFail("expected an error")
        } catch {
            XCTAssertEqual(error as? ReferalliTrackerError, .http(status: 400))
        }
    }

    func testFacadeRequiresConfigure() async {
        // configure() replaces the shared tracker; this asserts the configured path works.
        let transport = StubTransport(["/mobile/resolve": (200, #"{"matched":false}"#)])
        Referalli.configure(publishableKey: "tk_test", baseURL: URL(string: "https://api.example")!,
                            store: ReferalliMemoryStore(), transport: transport)
        let ref = await Referalli.getReferral()
        XCTAssertNil(ref)
        XCTAssertEqual(Referalli.shared?.publishableKey, "tk_test")
    }
}
