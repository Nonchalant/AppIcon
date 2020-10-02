enum AppIconSetGenerator {
    static func all(with platforms: Set<Platform>) -> [AppIconSet] {
        return platforms
            .map { platform -> [AppIconSet] in
                platform.appIconSets.map { $0.set(with: platform) }
            }
            .reduce([]) { $0 + $1 }
    }
}
