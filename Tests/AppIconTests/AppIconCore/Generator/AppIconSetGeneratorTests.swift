import Tablier
import XCTest
@testable import AppIconCore

class AppIconSetGeneratorTests: XCTestCase {

    func test_platforms() {
        typealias Input = Set<Platform>
        typealias Output = [AppIconSet]

        let recipe = Recipe<Input, Output> { input, _, _ in
            return AppIconSetGenerator.all(with: input)
        }

        recipe.assert(with: self) {
            $0.when(Set([.iphone]))
                .expect([AppIconSet(baseSize: 20.0, platform: .iphone, scales: Set([.twice, .triple])),
                         AppIconSet(baseSize: 29.0, platform: .iphone, scales: Set([.twice, .triple])),
                         AppIconSet(baseSize: 40.0, platform: .iphone, scales: Set([.twice, .triple])),
                         AppIconSet(baseSize: 60.0, platform: .iphone, scales: Set([.twice, .triple]))])

            $0.when(Set([.iosMarketing]))
                .expect([AppIconSet(baseSize: 1024.0, platform: .iosMarketing, scales: Set([.single]))])

            $0.when(Set([.ipad]))
                .expect([AppIconSet(baseSize: 20.0, platform: .ipad, scales: Set([.single, .twice])),
                         AppIconSet(baseSize: 29.0, platform: .ipad, scales: Set([.single, .twice])),
                         AppIconSet(baseSize: 40.0, platform: .ipad, scales: Set([.single, .twice])),
                         AppIconSet(baseSize: 76.0, platform: .ipad, scales: Set([.single, .twice])),
                         AppIconSet(baseSize: 83.5, platform: .ipad, scales: Set([.twice]))])

            $0.when(Set([.mac]))
                .expect([AppIconSet(baseSize: 16.0, platform: .mac, scales: Set([.single, .twice])),
                         AppIconSet(baseSize: 32.0, platform: .mac, scales: Set([.single, .twice])),
                         AppIconSet(baseSize: 128.0, platform: .mac, scales: Set([.single, .twice])),
                         AppIconSet(baseSize: 256.0, platform: .mac, scales: Set([.single, .twice])),
                         AppIconSet(baseSize: 512.0, platform: .mac, scales: Set([.single, .twice]))])

            $0.when(Set([.watch]))
                .expect([AppIconSet(baseSize: 24.0, role: "notificationCenter", subtype: "38mm", platform: .watch, scales: Set([.twice])),
                         AppIconSet(baseSize: 27.5, role: "notificationCenter", subtype: "42mm", platform: .watch, scales: Set([.twice])),
                         AppIconSet(baseSize: 29.0, role: "companionSettings", platform: .watch, scales: Set([.twice, .triple])),
                         AppIconSet(baseSize: 40.0, role: "appLauncher", subtype: "38mm", platform: .watch, scales: Set([.twice])),
                         AppIconSet(baseSize: 44.0, role: "appLauncher", subtype: "40mm", platform: .watch, scales: Set([.twice])),
                         AppIconSet(baseSize: 50.0, role: "appLauncher", subtype: "44mm", platform: .watch, scales: Set([.twice])),
                         AppIconSet(baseSize: 86.0, role: "quickLook", subtype: "38mm", platform: .watch, scales: Set([.twice])),
                         AppIconSet(baseSize: 98.0, role: "quickLook", subtype: "42mm", platform: .watch, scales: Set([.twice])),
                         AppIconSet(baseSize: 108.0, role: "quickLook", subtype: "44mm", platform: .watch, scales: Set([.twice]))])

            $0.when(Set([.watchMarketing]))
                .expect([AppIconSet(baseSize: 1024.0, platform: .watchMarketing, scales: Set([.single]))])
        }
    }
}
