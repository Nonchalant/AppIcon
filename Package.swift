// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "AppIcon",
    products: [
        .executable(name: "AppIcon", targets: ["AppIcon"])
    ],
    dependencies: [
        .package(url: "https://github.com/kylef/Commander", from: "0.8.0"),
        .package(url: "https://github.com/kareman/SwiftShell.git", "4.0.0"..<"5.0.0"),
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
                "Commander",
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
