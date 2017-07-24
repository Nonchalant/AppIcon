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
    public typealias T = [Platform]
    public typealias U = (iconName: String, path: String)

    public static func extract(input: T, output: U) throws {
        do {
            try Command.createJSON(json: generate(input: AppIcons.all(with: input), iconName: output.iconName), output: "\(output.path)/Contents.json").execute()
        } catch {
            throw LocalError.extraction
        }
    }

    private static func generate(input: [AppIconSet], iconName: String) -> String {
        let images = input.map { iconSet -> [[String: String]] in
            iconSet.all.map {
                [
                    "idiom": iconSet.idiom,
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
