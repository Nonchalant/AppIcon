protocol AppIconSetType {
    var baseSize: Float { get }
    var role: String? { get }
    var subtype: String? { get }
    func set(with platform: Platform) -> AppIconSet
}

extension AppIconSetType {
    var role: String? { nil }

    var subtype: String? { nil }

    func set(with platform: Platform) -> AppIconSet {
        return AppIconSet(
            baseSize: baseSize,
            role: role,
            subtype: subtype,
            platform: platform,
            scales: platform.scales
        )
    }
}
