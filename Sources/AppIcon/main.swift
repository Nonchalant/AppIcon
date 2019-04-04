import AppIconCore
import Commander

let main = command(
    Argument<String>("base image (1024x1024.png)", description: "The path of the base image"),
    Option("icon-name", default: "AppIcon", description: "The name of the generated image"),
    Option("output-path", default: "AppIcon", description: "The path of the generated appiconset"),
    Flag("ipad", description: "Whether or not to generate iPad icons"),
    Flag("mac", description: "Whether or not to generate Mac icons")
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
        print("Image Extraction Error has occured 😱")
    }

    do {
        try JSONExtractor.extract(input: platforms, output: (iconName, outputPath))
    } catch {
        print("JSON Extraction Error has occured 😱")
    }

    print("\(outputPath) has been generated 🎉")
}

main.run("1.0.3")
