import Tablier
import XCTest
@testable import AppIconCore

class AppIconTests: XCTestCase {

    func test_scale() {
        let recipe = Recipe<AppIcon, String?> { input in
            input.scaleForJson
        }

        recipe.assert(with: self) {
            $0.when(.init(name: "", platform: .ios, scale: ._1x, size: 0))
                .expect("1x")

            $0.when(.init(name: "", platform: .watch, scale: ._1x, size: 0))
                .expect(nil)

            $0.when(.init(name: "", platform: .watch, scale: ._2x, size: 0))
                .expect("2x")
        }
    }

    func test_size() {
        let recipe = Recipe<AppIcon, String> { input in
            input.baseSizeStr
        }

        recipe.assert(with: self) {
            $0.when(.init(name: "", platform: .ios, scale: ._1x, size: 10.0))
                .expect("10")

            $0.when(.init(name: "", platform: .watch, scale: ._1x, size: 10.1))
                .expect("10.1")
        }
    }
}
