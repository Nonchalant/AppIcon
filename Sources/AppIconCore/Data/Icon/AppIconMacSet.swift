enum AppIconMacSet: AppIconSetType, CaseIterable {
    case small2
    case small
    case medium
    case large
    case large2

    var baseSize: Float {
        switch self {
        case .small2:
            return 16.0
        case .small:
            return 32.0
        case .medium:
            return 128.0
        case .large:
            return 256.0
        case .large2:
            return 512.0
        }
    }
}
