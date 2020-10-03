import Tablier
import XCTest
@testable import AppIconCore

class PlatformTests: XCTestCase {

    func test_platforms() {
        struct Input {
            let ipad: Bool
            let mac: Bool
            let watch: Bool
        }

        typealias Output = Set<Platform>

        let recipe = Recipe<Input, Output> { input, _, _ in
            return Platform.platforms(ipad: input.ipad, mac: input.mac, watch: input.watch)
        }

        recipe.assert(with: self) {
            $0.when(.init(ipad: true, mac: true, watch: true))
                .expect(Set([.iphone, .ipad, .iosMarketing, .mac, .watch, .watchMarketing]))

            $0.when(.init(ipad: true, mac: true, watch: false))
                .expect(Set([.iphone, .ipad, .iosMarketing, .mac]))

            $0.when(.init(ipad: true, mac: false, watch: true))
                .expect(Set([.iphone, .ipad, .iosMarketing, .watch, .watchMarketing]))

            $0.when(.init(ipad: true, mac: false, watch: false))
                .expect(Set([.iphone, .ipad, .iosMarketing]))

            $0.when(.init(ipad: false, mac: true, watch: true))
                .expect(Set([.mac, .watch, .watchMarketing]))

            $0.when(.init(ipad: false, mac: true, watch: false))
                .expect(Set([.mac]))

            $0.when(.init(ipad: false, mac: false, watch: true))
                .expect(Set([.iphone, .iosMarketing, .watch, .watchMarketing]))

            $0.when(.init(ipad: false, mac: false, watch: false))
                .expect(Set([.iphone, .iosMarketing]))
        }
    }
}
