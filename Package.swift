// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CLITable",
    platforms: [
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "CLITable",
            targets: ["CLITable"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/onevcat/Rainbow", exact: "4.0.1")
    ],
    targets: [
        .target(
            name: "CLITable",
            dependencies: ["Rainbow"]
        ),
        .testTarget(
            name: "CLITableTests",
            dependencies: ["CLITable"]
        )
    ]
)
