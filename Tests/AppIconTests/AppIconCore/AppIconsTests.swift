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
    
    func testAllWithWatch() {
         let target = AppIcons.all(with: [.watch])
        
        debugPrint(target)
        
         XCTAssertEqual(target, [
             AppIconSet(baseSize: 29.0, platform: .watch),
             AppIconSet(baseSize: 20.0, platform: .watch),
             AppIconSet(baseSize: 24.0, platform: .watch),
             AppIconSet(baseSize: 27.5, platform: .watch),
             AppIconSet(baseSize: 22.0, platform: .watch),
             AppIconSet(baseSize: 25.0, platform: .watch),
             AppIconSet(baseSize: 43.0, platform: .watch),
             AppIconSet(baseSize: 49.0, platform: .watch),
             AppIconSet(baseSize: 54.0, platform: .watch)
         ])
     }
    
}
