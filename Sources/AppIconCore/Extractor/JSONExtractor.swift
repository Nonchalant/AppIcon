//
//  JSONExtractor.swift
//  AppIcon
//
//  Created by Takeshi Ihara on 2017/05/10.
//
//

import Foundation
import SwiftyJSON

public struct JSONExtractor: Extractor {
    public typealias T = [AppIcons]
    public typealias U = (iconName: String, path: String)

    public static func extract(base: T, output: U) throws {
        do {
            try Command.createJSON(json: generate(base: base, iconName: output.iconName), output: "\(output.path)/Contents.json").execute()
        } catch {
            throw LocalError.extraction
        }
    }

    private static func generate(base: T, iconName: String) -> String {
        let images = base.map {
            $0.set.all.map {
                [
                    "idiom": "iphone",
                    "size": "\($0.baseSizeStr)x\($0.baseSizeStr)",
                    "scale": $0.scale.rawValue,
                    "filename": $0.name(iconName: iconName)
                ]
            }
        }.flatMap { $0 }

        let json: JSON = [
            "images": images,
            "info": [
                "version": 1,
                "author": "appicon"
            ]
        ]

        return json.rawString() ?? ""
    }
}
