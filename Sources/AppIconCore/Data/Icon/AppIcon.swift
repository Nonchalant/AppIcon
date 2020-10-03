import Foundation

struct AppIcon: Hashable {
    let baseSize: Float
    let scale: Scale
}

extension AppIcon {
    func name(iconName: String) -> String {
        return "\(iconName)-\(baseSize)x\(baseSize)@\(scale.rawValue).png"
    }

    var size: Float {
        baseSize * scale.magnification
    }

    var baseSizeStr: String {
        return (baseSize == round(baseSize)) ? String(format: "%.f", baseSize) : "\(baseSize)"
    }
}
