//
//  main.swift
//  AppIcon
//
//  Created by Takeshi Ihara on 2017/05/10.
//
//

import Commander
import AppIconCore

let main = command(Argument<String>("base image (1024x1024)"), Option("output", "AppIcon", flag: "s")) { input, output in
    guard input.hasSuffix(".png") else {
        print("*.png is required 😱")
        return
    }

    let output = "\(output).appiconset"

    do {
        try ImageExtractor.extract(base: input, output: output)
    } catch {
        print("Image Extraction Error is occured 😱")
    }

    do {
        try JSONExtractor.extract(base: AppIcons.all, output: output)
    } catch {
        print("JSON Extraction Error is occured 😱")
    }

    print("\(output) is generated 🎉")
}

main.run()
