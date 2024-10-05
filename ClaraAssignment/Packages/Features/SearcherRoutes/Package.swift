// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SearcherRoutes",
    platforms: [.iOS(.v16)],
    products: [
        .library(
            name: "SearcherRoutes",
            targets: ["SearcherRoutes"]),
    ],
    dependencies: [
        .package(path: "../../Core"),
    ],
    targets: [
        .target(
            name: "SearcherRoutes",
            dependencies: [
                "Core",
            ]
        ),
        .testTarget(
            name: "SearcherRoutesTests",
            dependencies: ["SearcherRoutes"]
        ),
    ]
)
