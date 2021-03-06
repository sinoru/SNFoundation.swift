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
            dependencies: ["CustomExpressional", "Unknownable", "Weak"],
            swiftSettings: [ .unsafeFlags(["-enable-library-evolution"]) ]),
        .testTarget(
            name: "SNFoundationTests",
            dependencies: ["SNFoundation"]),
        .target(
            name: "CustomExpressional",
            swiftSettings: [ .unsafeFlags(["-enable-library-evolution"]) ]),
        .target(
            name: "Unknownable",
            dependencies: ["CustomExpressional"],
            swiftSettings: [ .unsafeFlags(["-enable-library-evolution"]) ]),
        .testTarget(
            name: "UnknownableTests",
            dependencies: ["Unknownable"]),
        .target(
            name: "Weak",
            swiftSettings: [ .unsafeFlags(["-enable-library-evolution"]) ]),
        .testTarget(
            name: "WeakTests",
            dependencies: ["Weak"]),
    ]
)
