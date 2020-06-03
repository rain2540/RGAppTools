//
//  DateExtensionTests.swift
//  RGAppToolsTests
//
//  Created by RAIN on 2020/4/24.
//  Copyright © 2020 Smartech. All rights reserved.
//

import XCTest
@testable import RGAppTools

class DateExtensionTests: XCTestCase {

    func testIsLeapYear() {
        XCTAssertEqual(Date.rat.isLeapYear(for: 2019), false)
        XCTAssertEqual(Date.rat.isLeapYear(for: 2020), true)
        XCTAssertEqual(Date.rat.isLeapYear(for: 1900), false)
        XCTAssertEqual(Date.rat.isLeapYear(for: 2000), true)

        let date = Date()
        XCTAssertEqual(date.rat.isLeaoYear, true)
    }

}
