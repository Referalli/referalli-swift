// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "Referalli",
    platforms: [.macOS(.v12), .iOS(.v15), .tvOS(.v15), .watchOS(.v8), .visionOS(.v1)],
    products: [
        .library(name: "Referalli", targets: ["Referalli"]),
    ],
    dependencies: [
        // HMAC for webhook verification on Linux (Apple platforms use CryptoKit).
        .package(url: "https://github.com/apple/swift-crypto.git", "3.0.0"..<"5.0.0"),
    ],
    targets: [
        .target(
            name: "Referalli",
            dependencies: [.product(name: "Crypto", package: "swift-crypto", condition: .when(platforms: [.linux]))],
            path: "Sources/Referalli",
            // Apple privacy manifest for the app tracker (maintained with the mobile SDKs).
            resources: [.copy("PrivacyInfo.xcprivacy")]
        ),
        .testTarget(name: "ReferalliTests", dependencies: ["Referalli"], path: "Tests/ReferalliTests"),
    ]
)
