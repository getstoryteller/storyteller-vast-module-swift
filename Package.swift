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
        .package(url: "https://github.com/getstoryteller/storyteller-sdk-swift-package", exact: "11.5.1")
    ],
    targets: [
        .binaryTarget(name: "StorytellerVASTIntegration",
                      url: "https://storyteller.azureedge.net/sdk-ios/xcframeworks/11.5.1/StorytellerVASTIntegration.zip",
                      checksum: "89bb5ca32d81b828dc115cd7e5cbd80c9b24f3df776bae121477c6a4ac25941d"),
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
