// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Artist",
    platforms: [.iOS(.v16)],
    products: [
        .library(
            name: "Artist",
            targets: ["Artist"]),
    ],
    dependencies: [
        .package(path: "../../Core"),
        .package(path: "../../UI"),
        .package(path: "../SearcherRoutes"),
    ],
    targets: [
        .target(
            name: "Artist",
            dependencies: [
                "Core",
                "UI",
                "SearcherRoutes"
            ]
        ),
        .testTarget(
            name: "ArtistTests",
            dependencies: ["Artist"]
        ),
    ]
)
