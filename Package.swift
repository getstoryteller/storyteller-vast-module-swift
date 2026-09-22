// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "storyteller-vast-integration",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "StorytellerVASTIntegration",
            targets: ["StorytellerVASTTarget"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/getstoryteller/storyteller-sdk-swift-package", exact: "11.7.1")
    ],
    targets: [
        .binaryTarget(name: "StorytellerVASTIntegration",
                      url: "https://feeds.usestoryteller.com/sdk-ios/xcframeworks/11.7.1/StorytellerVASTIntegration.zip",
                      checksum: "7436030bb57d78059a482e761bb4a08e10b2e2049efd9542b88e0bf221237659"),
        .target(
            name: "StorytellerVASTTarget",
            dependencies: [
                .target(name: "StorytellerVASTIntegration"),
                .product(name: "StorytellerSDK", package: "storyteller-sdk-swift-package"),
            ],
            path: "Sources"
        )
    ]
)
