// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Searcher",
    platforms: [.iOS(.v16)],
    products: [
        .library(
            name: "Searcher",
            targets: ["Searcher"]),
    ],
    dependencies: [
        .package(path: "../../Core"),
        .package(path: "../../UI"),
        .package(path: "../SearcherRoutes"),
    ],
    targets: [
        .target(
            name: "Searcher",
            dependencies: [
                "Core",
                "UI",
                "SearcherRoutes"
            ]
        ),
        .testTarget(
            name: "SearcherTests",
            dependencies: ["Searcher"]
        ),
    ]
)
