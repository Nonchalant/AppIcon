//
//  AppIconsTests.swift
//  AppIcon
//
//  Created by Takeshi Ihara on 2017/05/15.
//
//

import Foundation
import XCTest
@testable import AppIconCore

class AppIconsTests: XCTestCase {
    func testAll() {
        let target = AppIcons.all
        XCTAssertEqual(target, [AppIcons.notification, AppIcons.settings, AppIcons.spotlight, AppIcons.app])
    }

    func testAppIconSet() {
        let target = AppIcons.notification

        // Single
        XCTAssertEqual(target.set.single.baseSize, 20.0)
        XCTAssertEqual(target.set.single.baseSizeStr, "20")
        XCTAssertEqual(target.set.single.size, 20.0)
        XCTAssertEqual(target.set.single.name(iconName: "iconName"), "iconName-20.0x20.0@1x.png")

        // Twice
        XCTAssertEqual(target.set.twice.baseSize, 20.0)
        XCTAssertEqual(target.set.twice.baseSizeStr, "20")
        XCTAssertEqual(target.set.twice.size, 40.0)
        XCTAssertEqual(target.set.twice.name(iconName: "iconName2x"), "iconName2x-20.0x20.0@2x.png")

        // Triple
        XCTAssertEqual(target.set.triple.baseSize, 20.0)
        XCTAssertEqual(target.set.triple.baseSizeStr, "20")
        XCTAssertEqual(target.set.triple.size, 60.0)
        XCTAssertEqual(target.set.triple.name(iconName: "iconName3x"), "iconName3x-20.0x20.0@3x.png")
    }
}
