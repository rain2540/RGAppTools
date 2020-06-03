//
//  UILabelExtensionTests.swift
//  RGAppToolsTests
//
//  Created by RAIN on 2020/6/3.
//  Copyright © 2020 Smartech. All rights reserved.
//

import XCTest
@testable import RGAppTools

class UILabelExtensionTests: XCTestCase {

    func testLabelHeight() {
        let defaultHeight = UILabel.rat.defaultHeight
        XCTAssertEqual(defaultHeight, 21.0)
    }

}
