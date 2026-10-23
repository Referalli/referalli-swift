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
        guard case .referralCreated = event.payload else { return XCTFail("payload is \(event.payload)") }
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
