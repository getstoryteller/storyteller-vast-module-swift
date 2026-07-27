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
        .package(url: "https://github.com/getstoryteller/storyteller-sdk-swift-package", exact: "11.5.2")
    ],
    targets: [
        .binaryTarget(name: "StorytellerVASTIntegration",
                      url: "https://storyteller.azureedge.net/sdk-ios/xcframeworks/11.5.2/StorytellerVASTIntegration.zip",
                      checksum: "84b7a7731a5bbc7076c4f698d8a1a0f5999776362aea47639385c6e478c8cf95"),
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
