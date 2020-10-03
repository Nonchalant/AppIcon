struct AppIconSet: Equatable {
    let baseSize: Float
    let role: String?
    let subtype: String?
    let platform: Platform
    let scales: Set<Scale>

    init(baseSize: Float, role: String? = nil, subtype: String? = nil, platform: Platform, scales: Set<Scale>) {
        self.baseSize = baseSize
        self.role = role
        self.subtype = subtype
        self.platform = platform
        self.scales = scales
    }
}

extension AppIconSet {
    var idiom: String {
        return platform.idiom
    }

    var all: Set<AppIcon> {
        return Set(scales.map({ AppIcon(baseSize: baseSize, scale: $0) }))
    }
}
