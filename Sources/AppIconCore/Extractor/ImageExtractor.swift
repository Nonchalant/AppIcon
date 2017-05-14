//
//  ImageExtractor.swift
//  AppIcon
//
//  Created by Takeshi Ihara on 2017/05/10.
//
//

import Foundation

public struct ImageExtractor: Extractor {
    public typealias T = String
    public typealias U = (iconName: String, path: String)

    public static func extract(base: T, output: U) throws {
        do {
            try Command.createDirectory(output: output.path).execute()

            for appIcons in AppIcons.all {
                try extract(base: base, output: output, iconSet: appIcons.set)
            }
        } catch {
            throw LocalError.extraction
        }
    }

    private static func extract(base: T, output: U, iconSet: AppIconSet) throws {
        for icon in iconSet.all {
            try Command.extractImage(base: base, output: "\(output.path)/\(icon.name(iconName: output.iconName))", size: icon.size).execute()
        }
    }
}
