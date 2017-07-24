//
//  Platform.swift
//  AppIcon
//
//  Created by Takeshi Ihara on 7/25/17.
//
//

import Foundation

public enum Platform: String {
    case iphone = "iphone"
    case ipad = "ipad"
    case mac = "mac"

    var scales: [Scale] {
        switch self {
        case .iphone:
            return [.twice, .triple]
        case .ipad, .mac:
            return [.single, .twice]
        }
    }

    var appIcons: [AppIcons] {
        switch self {
        case .iphone:
            return [.notification, .settings, .spotlight, .iphoneApp]
        case .ipad:
            return [.notification, .settings, .spotlight, .iPadApp, .iPadProApp]
        case .mac:
            return [.macSmall2, .macSmall, .macMedium, .macLarge, .macLarge2]
        }
    }

    public static func platforms(ipad: Bool, mac: Bool) -> [Platform] {
        switch (ipad, mac) {
        case (true, true):
            return [.iphone, .ipad, .mac]
        case (true, false):
            return [.iphone, .ipad]
        case (false, true):
            return [.mac]
        case (false, false):
            return [.iphone]
        }
    }
}
