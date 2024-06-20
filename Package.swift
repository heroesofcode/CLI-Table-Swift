// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CLITable",
    platforms: [
        .macOS(.v10_13)
    ],
    products: [
        .library(
            name: "CLITable",
            targets: ["CLITable"]
        ),
    ],
    targets: [
        .target(
            name: "CLITable"),
        .testTarget(
            name: "CLITableTests",
            dependencies: ["CLITable"]
        ),
    ]
)
