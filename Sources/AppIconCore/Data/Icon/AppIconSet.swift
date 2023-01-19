import Foundation

protocol AppIconSet {
    var size: Float { get }
    var platform: Platform { get }
    var scales: Set<Scale> { get }
}

extension AppIconSet {
    func icons(iconName: String) -> [AppIcon] {
        scales.map { scale in
            AppIcon(
                name: "\(iconName)-\(size)x\(size)@\(scale.rawValue).png",
                platform: platform,
                scale: scale,
                size: size
            )
        }
    }
}
