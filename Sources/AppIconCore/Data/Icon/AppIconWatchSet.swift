enum AppIconWatchSet: AppIconSetType, CaseIterable {
    case notificationCenter24
    case notificationCenter27_5
    case companionSettings
    case appLauncher40
    case appLauncher44
    case appLauncher50
    case quickLook86
    case quickLook98
    case quickLook108

    var baseSize: Float {
        switch self {
        case .notificationCenter24:
            return 24.0
        case .notificationCenter27_5:
            return 27.5
        case .companionSettings:
            return 29.0
        case .appLauncher40:
            return 40.0
        case .appLauncher44:
            return 44.0
        case .appLauncher50:
            return 50.0
        case .quickLook86:
            return 86.0
        case .quickLook98:
            return 98.0
        case .quickLook108:
            return 108.0
        }
    }

    var role: String? {
        switch self {
        case .notificationCenter24,
             .notificationCenter27_5:
            return "notificationCenter"
        case .appLauncher40,
             .appLauncher44,
             .appLauncher50:
            return "appLauncher"
        case .quickLook86,
             .quickLook98,
             .quickLook108:
            return "quickLook"
        case .companionSettings:
            return "companionSettings"
        }
    }

    var subtype: String? {
        switch self {
        case .notificationCenter24,
             .appLauncher40,
             .quickLook86:
            return "38mm"
        case .appLauncher44:
            return "40mm"
        case .notificationCenter27_5,
             .quickLook98:
            return "42mm"
        case .appLauncher50,
             .quickLook108:
            return "44mm"
        case .companionSettings:
            return nil
        }
    }

    func set(with platform: Platform) -> AppIconSet {
        switch self {
        case .notificationCenter24,
             .notificationCenter27_5,
             .appLauncher40,
             .appLauncher44,
             .appLauncher50,
             .quickLook86,
             .quickLook98,
             .quickLook108:
            return AppIconSet(
                baseSize: baseSize,
                role: role,
                subtype: subtype,
                platform: platform,
                scales: Set([.twice])
            )
        case .companionSettings:
            return AppIconSet(
                baseSize: baseSize,
                role: role,
                subtype: subtype,
                platform: platform,
                scales: platform.scales
            )
        }
    }
}
