import PackageDescription

let package = Package(
    name: "AppIcon",
    dependencies: [
        .Package(url: "https://github.com/kylef/Commander", majorVersion: 0),
        .Package(url: "https://github.com/kareman/SwiftShell.git", "3.0.0"),
        .Package(url: "https://github.com/SwiftyJSON/SwiftyJSON.git", versions: Version(1,0,0)..<Version(3, .max, .max))
    ]
)
