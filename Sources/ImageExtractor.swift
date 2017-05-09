//
//  ImageExtractor.swift
//  AppIconExtractor
//
//  Created by Takeshi Ihara on 2017/05/10.
//
//

import Foundation

struct ImageExtractor: Extractor {
    typealias T = String
    typealias U = String

    static func extract(base: T, output: U) throws {
        do {
            try Command.createDirectory(output: output).execute()

            for appIcons in AppIcons.all {
                try extract(base: base, output: output, iconSet: appIcons.set)
            }
        } catch {
            throw LocalError.extraction
        }
    }

    private static func extract(base: T, output: U, iconSet: AppIconSet) throws {
        for icon in iconSet.all {
            try Command.extractImage(base: base, output: "\(output)/\(icon.name)", size: icon.size).execute()
        }
    }
}
