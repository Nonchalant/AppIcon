//
//  AppIcon.swift
//  AppIcon
//
//  Created by Takeshi Ihara on 2017/05/10.
//
//

import Foundation

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
    let ipad: Bool
    let scales: [Scale]

    var idiom: String {
        return ipad ? "ipad" : "iphone"
    }

    var all: [AppIcon] {
        return scales.map { AppIcon(baseSize: baseSize, scale: $0) }
    }

    init(baseSize: Float, ipad: Bool = false, scales: [Scale]? = nil) {
        self.baseSize = baseSize
        self.ipad = ipad
        self.scales = scales ?? (ipad ? [.single, .twice] : [.twice, .triple])
    }
}

public enum AppIcons: Float {
    case notification = 20.0
    case settings = 29.0
    case spotlight = 40.0
    case app = 60.0
    case iPadApp = 76.0
    case iPadProApp = 83.5

    static func all(ipad: Bool = false) -> [AppIconSet] {
        return iphones.map { $0.set() } + (ipad ? ipads.map { $0.set(ipad: ipad) } : [])
    }

    private func set(ipad: Bool = false) -> AppIconSet {
        let scales = (self == .iPadProApp) ? [Scale.twice] : nil
        return AppIconSet(baseSize: self.rawValue, ipad: ipad, scales: scales)
    }

    private static var iphones: [AppIcons] {
        return [.notification, .settings, .spotlight, .app]
    }

    private static var ipads: [AppIcons] {
        return [.notification, .settings, .spotlight, .iPadApp, .iPadProApp]
    }
}
