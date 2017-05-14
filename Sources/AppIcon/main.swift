//
//  main.swift
//  AppIcon
//
//  Created by Takeshi Ihara on 2017/05/10.
//
//

import Commander
import AppIconCore

let main = command(Argument<String>("base image (1024x1024.png)"),
                   Option("icon-name", "AppIcon", flag: "s"),
                   Option("output-path", "AppIcon", flag: "s")) { input, iconName, path in
    guard input.hasSuffix(".png") else {
        throw ArgumentError.missingValue(argument: "base image (1024x1024.png)")
    }

    let outputPath = "\(path).appiconset"

    do {
        try ImageExtractor.extract(base: input, output: (iconName, outputPath))
    } catch {
        print("Image Extraction Error is occured 😱")
    }

    do {
        try JSONExtractor.extract(base: AppIcons.all, output: (iconName, outputPath))
    } catch {
        print("JSON Extraction Error is occured 😱")
    }

    print("\(outputPath) is generated 🎉")
}

main.run()
