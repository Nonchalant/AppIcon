import Foundation

public enum JsonExtractor {
    public static func extract(
        output: String,
        iconName: String,
        platform: Platform
    ) throws {
        do {
            let icons = platform.icons(iconName: iconName)
            try Command
                .createJSON(
                    json: generate(icons: icons),
                    output: "\(output)/Contents.json"
                )
                .execute()
        } catch {
            throw LocalError.extraction
        }
    }

    private static func generate(icons: Set<AppIcon>) -> String {
        let images = icons.map { icon in
            ContentsJson.Image(
                filename: icon.name,
                idiom: icon.platform.idiom,
                platform: icon.platform.rawValue,
                scale: icon.scaleForJson,
                size: "\(icon.baseSizeStr)x\(icon.baseSizeStr)"
            )
        }

        let json = ContentsJson(
            images: images,
            info: ContentsJson.Info(
                version: 1,
                author: "appicon"
            )
        )

        do {
            let data = try JSONEncoder().encode(json)
            return String(data: data, encoding: .utf8) ?? ""
        } catch {
            return ""
        }
    }
}
