//
//  AppIcon.swift
//  AppIconExtractor
//
//  Created by Takeshi Ihara on 2017/05/10.
//
//

import Foundation

struct Constants {
    static let appName = "Icon-App"
}

enum Scale: String {
    case single = "1x"
    case twice = "2x"
    case triple = "3x"
}

struct AppIcon {
    let baseSize: Float
    let scale: Scale

    init(baseSize: Float, scale: Scale = .single) {
        self.baseSize = baseSize
        self.scale = scale
    }

    var name: String {
        return "\(Constants.appName)-\(baseSize)x\(baseSize)@\(scale.rawValue).png"
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
    let icon: AppIcon

    var single: AppIcon {
        return AppIcon(baseSize: icon.size)
    }

    var twice: AppIcon {
        return AppIcon(baseSize: icon.size, scale: .twice)
    }

    var triple: AppIcon {
        return AppIcon(baseSize: icon.size, scale: .triple)
    }

    var all: [AppIcon] {
        return [twice, triple]
    }

    init(with icon: AppIcon) {
        self.icon = icon
    }
}

enum AppIcons: Float {
    case notification = 20.0
    case settings = 29.0
    case spotlight = 40.0
    case app = 60.0

    var set: AppIconSet {
        return AppIconSet(with: AppIcon(baseSize: self.rawValue))
    }

    static var all: [AppIcons] {
        return [.notification, .settings, .spotlight, .app]
    }
}
