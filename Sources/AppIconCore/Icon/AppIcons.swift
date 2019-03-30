import Foundation

struct AppIcon {
    let baseSize: Float
    let scale: Scale

    init(baseSize: Float, scale: Scale = .single) {
        self.baseSize = baseSize
        self.scale = scale
    }

    func name(iconName: String) -> String {
        return "\(iconName)-\(baseSize)x\(baseSize)@\(scale.rawValue).png"
    }

    var size: Float {
        switch scale {
        case .single:
            return baseSize
        case .twice:
            return baseSize * 2.0
        case .triple:
            return baseSize * 3.0
        }
    }

    var baseSizeStr: String {
        return (baseSize == round(baseSize)) ? String(format: "%.f", baseSize) : "\(baseSize)"
    }
}

struct AppIconSet {
    let baseSize: Float
    let platform: Platform
    let scales: [Scale]

    var idiom: String {
        return platform.rawValue
    }

    var all: [AppIcon] {
        return scales.map { AppIcon(baseSize: baseSize, scale: $0) }
    }

    init(baseSize: Float, platform: Platform, scales: [Scale]? = nil) {
        self.baseSize = baseSize
        self.platform = platform
        self.scales = scales ?? platform.scales
    }
}

public enum AppIcons: Float {
    // iPhone
    case notification = 20.0
    case settings     = 29.0
    case spotlight    = 40.0
    case iphoneApp    = 60.0

    // marketing
    case marketing    = 1024.0

    // iPad
    case iPadApp      = 76.0
    case iPadProApp   = 83.5

    // Mac
    case macSmall2    = 16.0
    case macSmall     = 32.0
    case macMedium    = 128.0
    case macLarge     = 256.0
    case macLarge2    = 512.0

    static func all(with platforms: [Platform]) -> [AppIconSet] {
        return platforms
            .map { platform -> [AppIconSet] in
                platform.appIcons.map { $0.set(with: platform) }
            }
            .reduce([]) { $0 + $1 }
    }

    private func set(with platform: Platform = .iphone) -> AppIconSet {
        let scales = twiceOnly.contains(self) ? [Scale.twice] : nil
        return AppIconSet(baseSize: self.rawValue, platform: platform, scales: scales)
    }

    private var twiceOnly: [AppIcons] {
        return [.iPadProApp]
    }
}
