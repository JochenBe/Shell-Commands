// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "Shell",
    platforms: [
        .macOS(.v10_10)
    ],
    products: [
        .library(
            name: "Shell",
            targets: ["Shell"]),
    ],
    targets: [
        .target(
            name: "Shell",
            dependencies: []),
        .testTarget(
            name: "ShellTests",
            dependencies: ["Shell"]),
    ]
)
