public enum Platform: Equatable {
    case ios
    case mac
    case watch
}

extension Platform {
    public init(mac: Bool, watch: Bool) {
        if mac {
            self = .mac
        } else if watch {
            self = .watch
        } else {
            self = .ios
        }
    }

    func icons(iconName: String) -> Set<AppIcon> {
        let icons: [AppIconSet] = {
            switch self {
            case .ios:
                return IosAppIconSet.allCases
            case .mac:
                return MacAppIconSet.allCases
            case .watch:
                return WatchAppIconSet.allCases
            }
        }()

        return Set(
            icons
                .map { $0.icons(iconName: iconName) }
                .flatMap { $0 }
        )
    }
}

extension Platform {
    var idiom: String {
        switch self {
        case .ios, .watch:
            return "universal"
        case .mac:
            return "mac"
        }
    }

    var rawValue: String? {
        switch self {
        case .ios:
            return "ios"
        case .mac:
            return nil
        case .watch:
            return "watchos"
        }
    }

    var isSingleTrimmed: Bool {
        switch self {
        case .ios, .mac:
            return false
        case .watch:
            return true
        }
    }
}
