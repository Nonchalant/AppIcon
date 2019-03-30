import Foundation

public struct JSONExtractor: Extractor {
    public typealias T = [Platform]
    public typealias U = (iconName: String, path: String)

    public static func extract(input: T, output: U) throws {
        do {
            try Command.createJSON(json: generate(input: AppIcons.all(with: input), iconName: output.iconName), output: "\(output.path)/Contents.json").execute()
        } catch {
            throw LocalError.extraction
        }
    }

    private static func generate(input: [AppIconSet], iconName: String) -> String {
        let images = input.map { iconSet -> [Image] in
            iconSet.all.map {
                Image(
                    idiom: iconSet.idiom,
                    size: "\($0.baseSizeStr)x\($0.baseSizeStr)",
                    scale: $0.scale.rawValue,
                    filename: $0.name(iconName: iconName)
                )
            }
        }.flatMap { $0 }

        let json = JSON(
            images: images,
            info: JSON.Info(
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

private struct JSON: Encodable {
    let images: [Image]
    let info: Info

    struct Info: Encodable {
        let version: Int
        let author: String
    }
}

private struct Image: Encodable {
    let idiom: String
    let size: String
    let scale: String
    let filename: String
}
