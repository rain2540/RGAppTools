//
//  UIButtonExtensionTests.swift
//  RGAppToolsTests
//
//  Created by RAIN on 2020/6/3.
//  Copyright © 2020 Smartech. All rights reserved.
//

import XCTest
@testable import RGAppTools

class UIButtonExtensionTests: XCTestCase {

    func testLabelHeight() {
        let defaultHeight = UIButton.rat.defaultHeight
        XCTAssertEqual(defaultHeight, 44.0)
    }

}
