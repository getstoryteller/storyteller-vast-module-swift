# Storyteller VAST Module

This module provides Storyteller's VAST integration as a standalone Swift package. It resolves VAST tags and maps compatible full-screen ads into the Storyteller SDK's Stories and Clips players.

## Installation

Add the package to your app through Swift Package Manager:

```text
https://github.com/getstoryteller/storyteller-vast-module-swift
```

Then add the `StorytellerVASTIntegration` product to your app target.

## Usage

Import Storyteller and the VAST integration module:

```swift
import StorytellerSDK
import StorytellerVASTIntegration
```

Create a VAST module configuration and register the module with `Storyteller`:

```swift
let config = StorytellerVASTModuleConfiguration(
    baseUrl: "https://ads.example.com/vast",
    requestParameters: { _ in
        [
            "placement": "storyteller",
            "format": "vast"
        ]
    },
    urlFormat: .queryString
)

let vastModule = StorytellerVASTModule(configuration: config)
Storyteller.modules = [vastModule]
```

The main customization point is the `StorytellerVASTModuleConfiguration` initializer:

```swift
init(
    baseUrl: String,
    requestParameters: @escaping (StorytellerAdRequestInfo) -> [String: String],
    urlFormat: StorytellerVASTURLFormat = .pathSegment,
    diagnosticsHandler: ((StorytellerVASTDiagnosticsEvent) -> Void)? = nil
)
```

where:

- `baseUrl` - the HTTPS base URL of the VAST tag endpoint.
- `requestParameters` - a closure called for each Story or Clip ad opportunity.
- `urlFormat` - the strategy used to serialize request parameters into the VAST tag URL.
- `diagnosticsHandler` - an optional closure that receives VAST request, parse, wrapper, media-selection, mapping, and failure diagnostics.
