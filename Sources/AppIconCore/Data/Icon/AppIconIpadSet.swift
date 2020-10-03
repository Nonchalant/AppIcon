enum AppIconIpadSet: AppIconSetType, CaseIterable {
    case notification
    case settings
    case spotlight
    case app
    case pro

    var baseSize: Float {
        switch self {
        case .notification:
            return 20.0
        case .settings:
            return 29.0
        case .spotlight:
            return 40.0
        case .app:
            return 76.0
        case .pro:
            return 83.5
        }
    }

    func set(with platform: Platform) -> AppIconSet {
        let scales = (self == .pro) ? [Scale.twice] : platform.scales
        return AppIconSet(baseSize: baseSize, platform: platform, scales: scales)
    }
}
