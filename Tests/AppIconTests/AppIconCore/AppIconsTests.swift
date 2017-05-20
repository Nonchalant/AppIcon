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
    func testDefaultAll() {
        let target = AppIcons.all()
        XCTAssertEqual(target, [
            AppIconSet(baseSize: 20.0),
            AppIconSet(baseSize: 29.0),
            AppIconSet(baseSize: 40.0),
            AppIconSet(baseSize: 60.0)
        ])
    }

    func testAllWithIPad() {
        let target = AppIcons.all(ipad: true)
        XCTAssertEqual(target, [
            AppIconSet(baseSize: 20.0),
            AppIconSet(baseSize: 29.0),
            AppIconSet(baseSize: 40.0),
            AppIconSet(baseSize: 60.0),
            AppIconSet(baseSize: 20.0, ipad: true),
            AppIconSet(baseSize: 29.0, ipad: true),
            AppIconSet(baseSize: 40.0, ipad: true),
            AppIconSet(baseSize: 76.0, ipad: true),
            AppIconSet(baseSize: 83.5, ipad: true, scales: [.twice])
        ])
    }

    func testAppIconSet() {
        let target = AppIcons.all().first

        // AppIconSet
        XCTAssertNotNil(target)

        // Scales
        XCTAssertEqual(target!.all.count, 2)

        // Twice
        XCTAssertEqual(target!.all[0].baseSize, 20.0)
        XCTAssertEqual(target!.all[0].baseSizeStr, "20")
        XCTAssertEqual(target!.all[0].size, 40.0)
        XCTAssertEqual(target!.all[0].name(iconName: "iconName2x"), "iconName2x-20.0x20.0@2x.png")

        // Triple
        XCTAssertEqual(target!.all[1].baseSize, 20.0)
        XCTAssertEqual(target!.all[1].baseSizeStr, "20")
        XCTAssertEqual(target!.all[1].size, 60.0)
        XCTAssertEqual(target!.all[1].name(iconName: "iconName3x"), "iconName3x-20.0x20.0@3x.png")
    }
}
