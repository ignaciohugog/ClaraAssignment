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
        .package(url: "https://github.com/onevcat/Kingfisher", from: "7.12.0"),
        .package(path: "../Core"),
    ],
    targets: [
        .target(
            name: "Searcher",
            dependencies: [
                "Kingfisher",
                "Core"
            ]
        ),
        .testTarget(
            name: "SearcherTests",
            dependencies: ["Searcher"]
        ),
    ]
)
