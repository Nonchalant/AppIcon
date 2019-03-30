import Foundation
import XCTest
@testable import AppIconCore

class AppIconsTests: XCTestCase {
    func testDefaultAll() {
        let target = AppIcons.all(with: [.iphone])
        XCTAssertEqual(target, [
            AppIconSet(baseSize: 20.0, platform: .iphone),
            AppIconSet(baseSize: 29.0, platform: .iphone),
            AppIconSet(baseSize: 40.0, platform: .iphone),
            AppIconSet(baseSize: 60.0, platform: .iphone)
        ])
    }

    func testAllWithIPad() {
        let target = AppIcons.all(with: [.iphone, .ipad])
        XCTAssertEqual(target, [
            AppIconSet(baseSize: 20.0, platform: .iphone),
            AppIconSet(baseSize: 29.0, platform: .iphone),
            AppIconSet(baseSize: 40.0, platform: .iphone),
            AppIconSet(baseSize: 60.0, platform: .iphone),
            AppIconSet(baseSize: 20.0, platform: .ipad),
            AppIconSet(baseSize: 29.0, platform: .ipad),
            AppIconSet(baseSize: 40.0, platform: .ipad),
            AppIconSet(baseSize: 76.0, platform: .ipad),
            AppIconSet(baseSize: 83.5, platform: .ipad, scales: [.twice])
        ])
    }

    func testAllWithMac() {
        let target = AppIcons.all(with: [.mac])
        XCTAssertEqual(target, [
            AppIconSet(baseSize: 16.0, platform: .mac),
            AppIconSet(baseSize: 32.0, platform: .mac),
            AppIconSet(baseSize: 128.0, platform: .mac),
            AppIconSet(baseSize: 256.0, platform: .mac),
            AppIconSet(baseSize: 512.0, platform: .mac)
        ])
    }
}
