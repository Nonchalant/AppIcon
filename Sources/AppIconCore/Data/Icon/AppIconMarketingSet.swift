enum AppIconIosMarketingSet: AppIconSetType, CaseIterable {
    case marketing

    var baseSize: Float {
        switch self {
        case .marketing:
            return 1024.0
        }
    }
}
