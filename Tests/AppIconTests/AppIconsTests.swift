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

        // Twice
        XCTAssertEqual(target.set.twice.baseSize, 20.0)
        XCTAssertEqual(target.set.twice.baseSizeStr, "20")
        XCTAssertEqual(target.set.twice.size, 40.0)

        // Triple
        XCTAssertEqual(target.set.triple.baseSize, 20.0)
        XCTAssertEqual(target.set.triple.baseSizeStr, "20")
        XCTAssertEqual(target.set.triple.size, 60.0)
    }
}
