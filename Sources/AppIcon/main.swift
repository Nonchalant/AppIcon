import AppIconCore
import ArgumentParser
import Foundation

struct AppIcon: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "appicon",
        abstract: "AppIcon generates *.appiconset contains each resolution image for iOS",
        version: "1.0.6"
    )

    @Argument(help: "The path to the base image (1024x1024.png)", completion: .file(extensions: ["png"]))
    var image: String

    @Option(help: "The name of the generated image")
    var iconName = "AppIcon"

    @Option(help: "The path of the generated appiconset")
    var outputPath = "AppIcon"

    @Flag(help: "Generate also Mac icons")
    var mac = false

    @Flag(help: "Generate also Apple Watch icons")
    var watch = false

    func run() throws {
        guard let `extension` = image.split(separator: ".").last,
              `extension`.caseInsensitiveCompare("png") == .orderedSame else {
            throw ValidationError("image path should have .png extension")
        }

        guard FileManager.default.fileExists(atPath: image) else {
            throw ValidationError("an input image is not exists")
        }

        let outputExpansion = ".appiconset"
        let outputPath = self.outputPath.hasSuffix(outputExpansion) ? self.outputPath : "\(self.outputPath)\(outputExpansion)"
        let platform = Platform(mac: mac, watch: watch)

        do {
            try ImageExtractor.extract(base: image, output: outputPath, iconName: iconName, platform: platform)
        } catch {
            print("Image Extraction Error has occurred 😱")
            throw ExitCode(1)
        }

        do {
            try JsonExtractor.extract(output: outputPath, iconName: iconName, platform: platform)
        } catch {
            print("Json Extraction Error has occurred 😱")
            throw ExitCode(1)
        }

        print("\(outputPath) has been generated 🎉")
    }
}

AppIcon.main()
