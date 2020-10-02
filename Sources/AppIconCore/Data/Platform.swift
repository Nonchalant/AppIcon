public enum Platform {
    case iphone
    case iosMarketing
    case ipad
    case mac
    case watch
    case watchMarketing
}

extension Platform {
    public static func platforms(ipad: Bool, mac: Bool, watch: Bool) -> Set<Platform> {
        var platforms: [Platform] = []

        platforms += ipad ? [.iphone, .ipad, .iosMarketing] : []
        platforms += mac ? [.mac] : [.iphone, .iosMarketing]
        platforms += watch ? [.watch, .watchMarketing] : []

        return Set(platforms)
    }
}

extension Platform {
    var idiom: String {
        switch self {
        case .iphone:
            return "iphone"
        case .iosMarketing:
            return "ios-marketing"
        case .ipad:
            return "ipad"
        case .mac:
            return "mac"
        case .watch:
            return "watch"
        case .watchMarketing:
            return "watch-marketing"
        }
    }

    var scales: Set<Scale> {
        switch self {
        case .iphone,
             .watch:
            return Set([.twice, .triple])
        case .iosMarketing,
             .watchMarketing:
            return Set([.single])
        case .ipad,
             .mac:
            return Set([.single, .twice])
        }
    }

    var appIconSets: [AppIconSetType] {
        switch self {
        case .iphone:
            return AppIconIphoneSet.allCases
        case .iosMarketing:
            return AppIconIosMarketingSet.allCases
        case .ipad:
            return AppIconIpadSet.allCases
        case .mac:
            return AppIconMacSet.allCases
        case .watch:
            return AppIconWatchSet.allCases
        case .watchMarketing:
            return AppIconWatchMarketingSet.allCases
        }
    }
}
