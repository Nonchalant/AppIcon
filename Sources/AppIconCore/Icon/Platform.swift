import Foundation

public enum Platform: String {
    case iphone = "iphone"
    case marketing = "ios-marketing"
    case ipad = "ipad"
    case mac = "mac"
    case watch = "watch"

    var scales: [Scale] {
        switch self {
        case .iphone, .watch:
            return [.twice, .triple]
        case .marketing:
            return [.single]
        case .ipad, .mac:
            return [.single, .twice]
        }
    }

    var appIcons: [AppIcons] {
        switch self {
        case .iphone:
            return [.notification, .settings, .spotlight, .iphoneApp]
        case .marketing:
            return [.marketing]
        case .ipad:
            return [.notification, .settings, .spotlight, .iPadApp, .iPadProApp]
        case .mac:
            return [.macSmall2, .macSmall, .macMedium, .macLarge, .macLarge2]
        case .watch:
            return [.settings, .notification, .watchNotification38, .watchNotification40, .watchHome40, .watchHome44, .watchShortLook38, .watchShortLook40, .watchShortLook44]
        }
    }

    public static func platforms(ipad: Bool, mac: Bool, watch: Bool) -> [Platform] {
        switch (ipad, mac, watch) {
        
        case (true, true, true):
            return [.iphone, .ipad, .marketing, .mac, .watch]
        case (true, true, false):
            return [.iphone, .ipad, .marketing, .mac]
            
        case (true, false, true):
            return [.iphone, .ipad, .marketing, .watch]
        case (true, false, false):
            return [.iphone, .ipad, .marketing]
            
        case (false, true, true):
            return [.mac, .marketing, .watch]
        case (false, true, false):
            return [.mac]
            
        case (false, false, true):
            return [.iphone, .marketing, .watch]
        case (false, false, false):
            return [.iphone, .marketing]
            
        }
    }
}
