![ios](https://img.shields.io/badge/iOS-13-green)

# UIKit Helpers

> Also available as a part of my [SwiftUI+ Collection](https://benkau.com/packages.json) – just add it to Xcode 13+

A set of UIKit helpers that simplify the usage of UIKit view's and controller's in SwiftUI. Many of these helpers are useful even in a pure UIKit project.

## UIWrapping

```swift
UIWrapping<UILabel> { view in
    view.numberOfLines = 0
    view.text = "Lets enable\nmultiple lines."
    view.textAlignment = .center
}
.background(Color.green)
.fixedSize()
```

## UIViewBuilder

Works exactly as you'd expect. Essentially just a UIView version-ish of a `ViewBuilder`.

It improves container-like APIs.

## Installation

The code is packaged as a framework. You can install manually (by copying the files in the `Sources` directory) or using Swift Package Manager (**preferred**)

To install using Swift Package Manager, add this to the `dependencies` section of your `Package.swift` file:

`.package(url: "https://github.com/SwiftUI-Plus/UIKitHelpers.git", .upToNextMinor(from: "1.0.0"))`

## Other Packages

If you want easy access to this and more packages, add the following collection to your Xcode 13+ configuration:

`https://benkau.com/packages.json`
