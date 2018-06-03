//
//  main.swift
//  AppIcon
//
//  Created by Takeshi Ihara on 2017/05/10.
//
//

import AppIconCore
import Commander

let main = command(
    Argument<String>("base image (1024x1024.png)", description: "The path of base image"),
    Option("icon-name", default: "AppIcon", description: "The name of generated image"),
    Option("output-path", default: "AppIcon", description: "The path of generated appiconset"),
    Flag("ipad", description: "Whether or not to generate ipad icon"),
    Flag("mac", description: "Whether or not to generate mac icon")
) { base, iconName, path, ipad, mac in
    guard base.hasSuffix(".png") else {
        throw ArgumentError.missingValue(argument: "base image (1024x1024.png)")
    }

    let outputExpansion = ".appiconset"
    let outputPath = path.hasSuffix(outputExpansion) ? path : "\(path)\(outputExpansion)"
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

main.run("0.33.0")
