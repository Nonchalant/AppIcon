// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "AppIcon",
    products: [
        .executable(name: "AppIcon", targets: ["AppIcon"])
    ],
    dependencies: [
        .package(url: "https://github.com/kylef/Commander", from: "0.8.0"),
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
    ],
    swiftLanguageVersions: [.v5]
)
