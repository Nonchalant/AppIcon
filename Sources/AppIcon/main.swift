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
                   Option("icon-name", "{AppIcon}-29.0x29.0@2x.png", description: "The name of generated icon name"),
                   Option("output-path", "{AppIcon}.appiconset", description: "The name of generated appiconset name"),
                   Flag("ipad", description: "Whether or not to generate ipad icon"),
                   Flag("mac", description: "Whether or not to generate mac icon")) { base, iconName, path, ipad, mac in
    guard base.hasSuffix(".png") else {
        throw ArgumentError.missingValue(argument: "base image (1024x1024.png)")
    }

    let outputPath = "\(path).appiconset"
    let platforms = Platform.platforms(ipad: ipad, mac: mac)

    do {
        try ImageExtractor.extract(input: (base, platforms), output: (iconName, outputPath))
    } catch {
        print("Image Extraction Error is occured 😱")
    }

    do {
        try JSONExtractor.extract(input: platforms, output: (iconName, outputPath))
    } catch {
        print("JSON Extraction Error is occured 😱")
    }

    print("\(outputPath) is generated 🎉")
}

main.run()
