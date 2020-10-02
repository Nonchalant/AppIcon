// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "AppIcon",
    products: [
        .executable(name: "AppIcon", targets: ["AppIcon"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "0.3.1"),
        .package(url: "https://github.com/kareman/SwiftShell.git", from: "5.1.0"),
    ],
    targets: [
        .target(
            name: "AppIcon",
            dependencies: [
                "AppIconCore"
            ]
        ),
        .target(
            name: "AppIconCore",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                "SwiftShell",
            ]
        ),
        .testTarget(
            name: "AppIconTests",
            dependencies: [
                "AppIconCore"
            ],
            path: "Tests"
        )
    ]
)
