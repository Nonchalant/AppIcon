import AppIconCore
import ArgumentParser

struct AppIcon: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "appicon",
        abstract: "AppIcon generates *.appiconset contains each resolution image for iOS",
        version: "1.0.5"
    )

    @Argument(help: "The path to the base image (1024x1024.png)")
    var image: String

    @Option(help: "The name of the generated image")
    var iconName = "AppIcon"

    @Option(help: "The path of the generated appiconset")
    var outputPath = "AppIcon"

    @Flag(help: "Whether or not to generate iPad icons")
    var ipad = false

    @Flag(help: "Whether or not to generate Mac icons")
    var mac = false

    @Flag(help: "Whether or not to generate Apple Watch icons")
    var watch = false

    func run() throws {
        guard image.hasSuffix(".png") else {
            throw ValidationError("image path should have .png extension")
        }

        let outputExpansion = ".appiconset"
        let outputPath = self.outputPath.hasSuffix(outputExpansion) ? self.outputPath : "\(self.outputPath)\(outputExpansion)"
        let platforms = Platform.platforms(ipad: ipad, mac: mac, watch: watch)

        do {
            try ImageExtractor.extract(input: (image, platforms), output: (iconName, outputPath))
        } catch {
            print("Image Extraction Error has occured 😱")
            throw ExitCode(1)
        }

        do {
            try JSONExtractor.extract(input: platforms, output: (iconName, outputPath))
        } catch {
            print("JSON Extraction Error has occured 😱")
            throw ExitCode(1)
        }

        print("\(outputPath) has been generated 🎉")
    }
}

AppIcon.main()
