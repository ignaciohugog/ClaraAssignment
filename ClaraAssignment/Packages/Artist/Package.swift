// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Artist",
    platforms: [.iOS(.v16)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Artist",
            targets: ["Artist"]),
    ],
    dependencies: [
        .package(path: "../Core"),
        .package(path: "../Navigation"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Artist",
            dependencies: [
                "Core",
                "Navigation"
            ]
        ),
        .testTarget(
            name: "ArtistTests",
            dependencies: ["Artist"]
        ),
    ]
)
