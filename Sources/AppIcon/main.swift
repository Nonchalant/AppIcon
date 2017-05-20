//
//  main.swift
//  AppIcon
//
//  Created by Takeshi Ihara on 2017/05/10.
//
//

import Commander
import AppIconCore

let main = command(Argument<String>("base image (1024x1024.png)", description: "The name of base image"),
                   Option("icon-name", "AppIcon", description: "The name of generated icon name"),
                   Option("output-path", "AppIcon", description: "The name of generated appiconset name"),
                   Flag("ipad", description: "Whether or not to generate ipad icon")) { base, iconName, path, ipad in
    guard base.hasSuffix(".png") else {
        throw ArgumentError.missingValue(argument: "base image (1024x1024.png)")
    }

    let outputPath = "\(path).appiconset"

    do {
        try ImageExtractor.extract(input: (base, ipad), output: (iconName, outputPath))
    } catch {
        print("Image Extraction Error is occured 😱")
    }

    do {
        try JSONExtractor.extract(input: ipad, output: (iconName, outputPath))
    } catch {
        print("JSON Extraction Error is occured 😱")
    }

    print("\(outputPath) is generated 🎉")
}

main.run()
