import Foundation

public enum JsonExtractor: Extractor {
    public typealias T = Set<Platform>
    public typealias U = (iconName: String, path: String)

    public static func extract(input: T, output: U) throws {
        do {
            try Command.createJSON(json: generate(input: AppIconSetGenerator.all(with: input), iconName: output.iconName), output: "\(output.path)/Contents.json").execute()
        } catch {
            throw LocalError.extraction
        }
    }

    private static func generate(input: [AppIconSet], iconName: String) -> String {
        let images = input.map { iconSet -> [ContentsJson.Image] in
            iconSet.all.map {
                ContentsJson.Image(
                    filename: $0.name(iconName: iconName),
                    idiom: iconSet.idiom,
                    role: iconSet.role,
                    scale: $0.scale.rawValue,
                    size: "\($0.baseSizeStr)x\($0.baseSizeStr)",
                    subtype: iconSet.subtype
                )
            }
        }.flatMap { $0 }

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
