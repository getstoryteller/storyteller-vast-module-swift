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
        .package(url: "https://github.com/getstoryteller/storyteller-sdk-swift-package", exact: "11.9.1")
    ],
    targets: [
        .binaryTarget(name: "StorytellerVASTIntegration",
                      url: "https://feeds.usestoryteller.com/sdk-ios/xcframeworks/11.9.1/StorytellerVASTIntegration.zip",
                      checksum: "9b67f518aa808db4f0108b1091866e03e8137b326183bec7ee6fac802c7f0747"),
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
