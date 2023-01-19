import Foundation

struct AppIcon: Hashable {
    let name: String
    let platform: Platform
    let scale: Scale
    let size: Float
}

extension AppIcon {
    var scaleSize: Float {
        size * scale.magnification
    }

    var scaleForJson: String? {
        platform.isSingleTrimmed && (scale == ._1x) ? nil : scale.rawValue
    }

    var baseSizeStr: String {
        (size == round(size)) ? String(format: "%.f", size) : "\(size)"
    }
}
