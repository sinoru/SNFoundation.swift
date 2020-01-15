// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SNFoundation",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "SNFoundation",
            targets: ["SNFoundation"]),
        .library(
            name: "SNFoundationDynamic",
            type: .dynamic,
            targets: ["SNFoundation"]),
        .library(
            name: "SNFoundationStatic",
            type: .static,
            targets: ["SNFoundation"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "SNFoundation",
            dependencies: ["CustomExpressional", "Unknownable", "Weak", "Purgeable", "Lazy"]),
        .testTarget(
            name: "SNFoundationTests",
            dependencies: ["SNFoundation"]),
        .target(
            name: "CustomExpressional"),
        .target(
            name: "Unknownable",
            dependencies: ["CustomExpressional"]),
        .testTarget(
            name: "UnknownableTests",
            dependencies: ["Unknownable"]),
        .target(
            name: "Weak"),
        .testTarget(
            name: "WeakTests",
            dependencies: ["Weak"]),
        .target(
            name: "Purgeable"),
        .target(
            name: "Lazy"),
        .testTarget(
            name: "LazyTests",
            dependencies: ["Lazy"]),
    ]
)
