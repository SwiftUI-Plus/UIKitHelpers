// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UIKitHelpers",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "UIKitHelpers",
            targets: ["UIKitHelpers"]
        ),
    ],
    targets: [
        .target(name: "UIKitHelpers")
    ]
)
