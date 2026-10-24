# Referalli Swift SDK

The official Swift package for [Referalli](https://referalli.com): a typed async API client for servers (Vapor, Hummingbird) and the attribution tracker for iOS and macOS apps.

- One typed `async` method per API operation, with `Codable` structs for every model.
- Retries with backoff, idempotency keys, timeouts, `AsyncThrowingStream` auto-paging and one error class per error code.
- Webhook signature verification and typed webhook payloads.
- Foundation only on Apple platforms (CryptoKit); `swift-crypto` on Linux. macOS 12, iOS 15, tvOS 15, watchOS 8, visionOS 1.

Docs: <https://referalli.com/docs>.

## Install

```swift
// Package.swift
dependencies: [
    .package(url: "https://github.com/Referalli/referalli-swift", from: "0.1.0"),
],
targets: [
    .target(name: "App", dependencies: [.product(name: "Referalli", package: "referalli-swift")]),
]
```

## Quickstart (server-side)

Keep the `rk_` API key on your server; never ship it in an app. (These samples are compiled in CI from `Sources/ReferalliConformance/ReadmeSamples.swift`.)

```swift
import Referalli

let client = ReferalliClient(apiKey: ProcessInfo.processInfo.environment["REFERALLI_API_KEY"])

// 1. Create a referral link for a partner
let link = try await client.postLinks(PostLinksBody(
    programId: "prg_123",
    partnerId: "ptr_123",
    destinationUrl: "https://example.com/pricing"
))
print(link.shortUrl ?? "")

// 2. Attribute a signup to the partner who referred it
_ = try await client.postReferralsAssociate(PostReferralsAssociateBody(programId: "prg_123", customerRef: "user_42", anonId: "anon_from_cookie"))

// 3. Track a conversion: a purchase your server has validated
_ = try await client.postMobilePurchases(PostMobilePurchasesBody(eventId: "order_1001", customerRef: "user_42", amountMinor: 4900, currency: "usd"))
```

Verify a webhook delivery (pass the raw body exactly as received):

```swift
func handleWebhook(rawBody: Data, headers: [String: String]) -> Int {
    let secret = ProcessInfo.processInfo.environment["REFERALLI_WEBHOOK_SECRET"] ?? ""
    do {
        let event = try ReferalliWebhook.constructEvent(rawBody: rawBody, headers: headers, secrets: [secret])
        if case let .commissionEarned(data) = event.payload {
            print("commission", data)
        }
        return 204
    } catch {
        return 400
    }
}
```

## Configuration

```swift
let client = ReferalliClient(
    apiKey: "rk_live_...",
    baseURL: ReferalliClient.defaultBaseURL, // https://referalli.com
    timeout: 30,                             // seconds per attempt
    maxRetries: 3,                           // retries for idempotent requests
    mode: .live                              // optional: assert the key's mode
)
let fast = client.withOptions(timeout: 5, maxRetries: 0)
```

Requests are pinned to `ReferalliVersion.api`; pass `apiVersion:` to pin another, and `session:` to use your own `URLSession`.

### Test mode

Use a test-mode key (`rk_test_...`) to work against your organization's test data. `mode: .test` makes every request assert it: the API rejects a request whose key is in the other mode with `ModeMismatchError`. Webhook events carry `livemode`.

## Errors

Every API error throws a subclass of `APIError` named after its code (`ValidationError`, `NotFoundError`, `RateLimitedError`, ...), with `status`, `code`, `message`, `requestId`, `docsUrl`, `details` and `retryAfter`. Network failures and timeouts throw `ReferalliError.connection` after the retries run out.

```swift
do {
    _ = try await client.getPartnersId(id: "ptr_missing")
} catch let e as NotFoundError {
    print(e.code, e.status, e.requestId ?? "", e.docsUrl ?? "")
} catch let e as RateLimitedError {
    print("retry after", e.retryAfter ?? 0)
} catch let e as APIError {
    print(e.code, e.message)
}
```

Retries: GET, PUT and DELETE requests, and writes carrying an `Idempotency-Key`, are retried on 429, 5xx and network errors with exponential backoff and jitter, honoring `Retry-After`. POST and PATCH requests always carry a key (generated unless you pass `idempotencyKey:`), reused across retries, so a retried write is applied once.

## Pagination

List methods return one `Page<T>`; their `Each` twin is an `AsyncThrowingStream` that follows the cursor.

```swift
let page = try await client.getPartners(status: "active", limit: 50)
_ = try await client.getPartners(status: "active", limit: 50, startingAfter: page.nextCursor)

for try await referral in client.getReferralsEach() {
    print(referral.id)
}
```

## Webhooks

`ReferalliWebhook.constructEvent(rawBody:headers:secrets:)` checks the Standard Webhooks signature (`webhook-id`, `webhook-timestamp`, `webhook-signature`) in constant time, rejects deliveries more than 5 minutes old or ahead (`toleranceSec:`), and returns a `WebhookEvent` whose `payload` is a `WebhookPayload` case per topic (`.referralCreated`, `.commissionEarned`, ...; topic names are in `WebhookTopic`). Pass two secrets while you rotate one. `ReferalliWebhook.verify(...)` returns a `Bool` instead of throwing.

## Any operation by id

```swift
let partner = try await client.call("getPartnersId", path: ["id": "ptr_123"])
let partners = try await client.listAll("getPartners", query: ["status": .string("active")])
```

## App tracker

The tracker in this package (`Tracker.swift`) records referral visits and identifies users from your iOS or macOS app with the public tracking token. It never uses an API key. See [the docs](https://referalli.com/docs).

## Versioning

This package follows semantic versioning; see [CHANGELOG.md](./CHANGELOG.md).

## License

MIT. See [LICENSE](./LICENSE).
