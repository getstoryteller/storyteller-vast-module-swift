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
        .package(url: "https://github.com/getstoryteller/storyteller-sdk-swift-package", exact: "11.8.0")
    ],
    targets: [
        .binaryTarget(name: "StorytellerVASTIntegration",
                      url: "https://feeds.usestoryteller.com/sdk-ios/xcframeworks/11.8.0/StorytellerVASTIntegration.zip",
                      checksum: "09179eecac8cd6661fd374a039d005c9eace030bd155570a6c1b15955087ed2f"),
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
