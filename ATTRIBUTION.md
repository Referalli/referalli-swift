# App attribution on iOS

The `Referalli` package includes an app tracker: referral links (universal links and custom
schemes), deferred deep links on the first open after install, and signup tracking. Foundation
only; iOS 15+, macOS 12+, tvOS 15+, watchOS 8+.

## Set up

```swift
import Referalli

@main
struct MyApp: App {
    init() {
        // The tracking token (Settings → Tracking) is public and safe to ship in the app.
        Referalli.configure(publishableKey: "tk_…", programId: "prg_…")
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .onOpenURL { Referalli.handle(url: $0) }                       // custom scheme
                .onContinueUserActivity(NSUserActivityTypeBrowsingWeb) {       // universal links
                    Referalli.handle(userActivity: $0)
                }
                .task {
                    if let referral = await Referalli.getReferral() {
                        // referral.code, referral.destination (deferred matches), referral.source
                    }
                }
        }
    }
}

// After the user signs up (customerRef is your user id, the same one your billing uses):
let result = try await Referalli.trackSignup(customerRef: user.id)
```

UIKit: call `Referalli.handle(userActivity:)` from
`scene(_:continue:)` / `application(_:continue:restorationHandler:)`, and `Referalli.handle(url:)`
from `scene(_:openURLContexts:)` / `application(_:open:options:)`. Completion-handler variants of
`getReferral` and `trackSignup` exist for call sites without `async`.

## How the referral is found

`getReferral()` returns the first of:

1. **A link.** A referral link (`https://<link-domain>/go/<token>/<code>`) redirects to the
   destination you set on the link with `?via=<code>&ref_click_id=<click>`. When the destination
   is a universal link of your app (your domain serves `apple-app-site-association` and the app
   has the `applinks:<domain>` associated domain), iOS opens the app and `handle` stores the click.
   Opening a `/go/` URL in the app directly also works: the SDK records the click.
2. **A deferred match** (first open only, within an hour of the click): the API matches the
   IP address of this request to a recent link click and returns its click id and the link's
   destination, so you can route the new user to the screen the link pointed at.

A link opened later always replaces the stored referral. Unmatched first opens are not retried;
network failures are.

`trackSignup` records `identify` (install id to your customer reference) and, when a program id
is known (from `configure` or the deferred match), `POST /t/<token>/mobile/install`, which
attributes the customer to the referring partner. Without a program id only the identify link is
recorded.

In-app purchases are reported from your backend, never from the app: validate the receipt on your
server and call `POST /v1/mobile/purchases` with a secret API key (`ReferalliClient` on the server).

## Privacy and App Tracking Transparency

- **No IDFA, no IDFV, no pasteboard, no ATT framework.** The SDK keeps a random install id and the
  captured referral in `UserDefaults` and sends them, plus the customer reference you pass to
  `trackSignup`/`identify`, to Referalli.
- **Privacy manifest.** `PrivacyInfo.xcprivacy` declares `NSPrivacyTracking = false`, no tracking
  domains, *User ID* and *Device ID* (the random install id) collected for app functionality and
  analytics, linked to the user, not used for tracking, and the `UserDefaults` required-reason API
  (`CA92.1`). Mirror these in your App Store privacy labels.
- **Links are deterministic.** Universal links and custom-scheme links are opened by the user
  and carry the click id; they do not involve tracking.
- **Deferred matching is probabilistic.** It compares the IP address of the first app open with
  recent link clicks. Under Apple's rules, *tracking* is linking data from your app with data
  from other companies' apps or websites for targeted advertising or advertising measurement, and
  fingerprinting is not allowed even with consent. Whether referral attribution falls under that
  depends on your program: invite-a-friend links on your own domain are first-party; paid
  affiliate placements on third-party sites can count as advertising measurement.
  If you are unsure:
  - configure with `deferredResolution: false`, and
  - call `Referalli.resolveDeferred()` only after the user granted permission through your own
    `ATTrackingManager.requestTrackingAuthorization` prompt (and then declare tracking in your own
    privacy manifest and labels), or not at all.

  Links keep working with deferred matching off.

## Testing

`ReferalliTracker` takes a `ReferalliKeyValueStore` (`ReferalliMemoryStore` in tests) and a
`ReferalliTransport` (stub the HTTP exchange), and `ReferalliTracker.parse(url:)` is pure.
