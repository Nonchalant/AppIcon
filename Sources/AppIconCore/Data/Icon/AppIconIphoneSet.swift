enum AppIconIphoneSet: AppIconSetType, CaseIterable {
    case notification
    case settings
    case spotlight
    case app

    var baseSize: Float {
        switch self {
        case .notification:
            return 20.0
        case .settings:
            return 29.0
        case .spotlight:
            return 40.0
        case .app:
            return 60.0
        }
    }
}
