import Foundation
import XCTest
@testable import Referalli

final class WebhookTests: XCTestCase {
    // The first case of the shared vectors (packages/webhooks/test/vectors.json).
    let body = #"{"id":"evt_1","topic":"referral.created","orgId":"org_1","data":{"partnerId":"ptr_1"}}"#
    let headers = [
        "webhook-id": "whd_01JBVECTOR00000000000000",
        "webhook-timestamp": "1792600000",
        "webhook-signature": "v1,+xJ35/YtD1Xkp8yDurdHWWys5eBy+FTQji/7DJUI8Nw=",
    ]
    let secret = "whsec_MfKQ9r8GKYqrTwjUPD8ILPZIo2LaLaSw"
    let now = Date(timeIntervalSince1970: 1_792_600_010)

    func testConstructEventDecodesTheTopic() throws {
        let event = try ReferalliWebhook.constructEvent(rawBody: Data(body.utf8), headers: headers, secrets: [secret], now: now)
        XCTAssertEqual(event.topic, WebhookTopic.referralCreated)
        XCTAssertEqual(event.orgId, "org_1")
        // The shared vector's data is partial (only partnerId), so it decodes to the unknown fallback.
        guard case .unknown = event.payload else { return XCTFail("payload is \(event.payload)") }
    }

    func testCompletePayloadDecodesToItsTypedCase() throws {
        let full = #"{"referralId":"ref_1","programId":"prg_1","partnerId":"ptr_1","customerRef":"cus_1","status":"pending","matchedVia":"link"}"#
        let data = try JSONDecoder().decode(JSONValue.self, from: Data(full.utf8))
        guard case .referralCreated = try WebhookPayload.decode(topic: "referral.created", data: data) else {
            return XCTFail("a complete referral.created payload did not decode to .referralCreated")
        }
    }

    func testRejectsTamperingStaleAndWrongSecrets() {
        XCTAssertFalse(ReferalliWebhook.verify(rawBody: Data((body + " ").utf8), headers: headers, secrets: [secret], now: now))
        XCTAssertFalse(ReferalliWebhook.verify(rawBody: Data(body.utf8), headers: headers, secrets: [secret], now: now.addingTimeInterval(400)))
        XCTAssertFalse(ReferalliWebhook.verify(rawBody: Data(body.utf8), headers: headers, secrets: ["whsec_b3RoZXI="], now: now))
        XCTAssertThrowsError(try ReferalliWebhook.constructEvent(rawBody: Data(body.utf8), headers: [:], secrets: [secret], now: now))
    }

    func testClientOptions() {
        let client = ReferalliClient(apiKey: "rk_test_1", mode: .test)
        let fast = client.withOptions(timeout: 5)
        XCTAssertEqual(fast.timeout, 5)
        XCTAssertEqual(fast.mode, .test)
        XCTAssertEqual(client.timeout, 30)
    }
}
