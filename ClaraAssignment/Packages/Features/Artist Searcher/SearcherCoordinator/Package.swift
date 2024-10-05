// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SearcherCoordinator",
    platforms: [.iOS(.v16)],
    products: [
        .library(
            name: "SearcherCoordinator",
            targets: ["SearcherCoordinator"]),
    ],
    dependencies: [
        .package(path: "../../Core"),
        .package(path: "../SearcherRoutes"),
        .package(path: "../Album"),
        .package(path: "../Artist"),
        .package(path: "../Searcher"),
    ],
    targets: [
        .target(
            name: "SearcherCoordinator",
            dependencies: [
                "Core",
                "SearcherRoutes",
                "Album",
                "Artist",
                "Searcher"
            ]
        ),
        .testTarget(
            name: "SearcherCoordinatorTests",
            dependencies: ["SearcherCoordinator"]
        ),
    ]
)
