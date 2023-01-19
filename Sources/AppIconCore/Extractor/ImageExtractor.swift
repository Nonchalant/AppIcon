import Foundation

public enum ImageExtractor {
    public static func extract(
        base: String,
        output: String,
        iconName: String,
        platform: Platform
    ) throws {
        do {
            try Command.createDirectory(output: output).execute()

            let icons = platform.icons(iconName: iconName)
            try extract(base: base, output: output, icons: icons)
        } catch {
            throw LocalError.extraction
        }
    }

    private static func extract(
        base: String,
        output: String,
        icons: Set<AppIcon>
    ) throws {
        for icon in icons {
            try Command
                .extractImage(
                    base: base,
                    output: "\(output)/\(icon.name)",
                    size: icon.scaleSize
                )
                .execute()
        }
    }
}
