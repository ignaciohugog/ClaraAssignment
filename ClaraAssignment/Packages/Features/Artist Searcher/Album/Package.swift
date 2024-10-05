// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Album",
    platforms: [.iOS(.v16)],
    products: [
        .library(
            name: "Album",
            targets: ["Album"]),
    ],
    dependencies: [
        .package(path: "../../Core"),
        .package(path: "../../UI"),
        .package(path: "../SearcherRoutes"),
    ],
    targets: [
        .target(
            name: "Album",
            dependencies: [
                "Core",
                "UI",
                "SearcherRoutes"
            ]
        ),
        .testTarget(
            name: "AlbumTests",
            dependencies: ["Album"]
        ),
    ]
)
