//
//  StringExtensionTests.swift
//  RGAppToolsTests
//
//  Created by RAIN on 2020/1/21.
//  Copyright © 2020 Smartech. All rights reserved.
//

import XCTest
@testable import RGAppTools

class StringExtensionTests: XCTestCase {

    func testStringTrans() {
        let s = "5"
        XCTAssertEqual(s.rat.intValue, 5)
        
        
        
        let bh = UIButton.rat.defaultHeight
        XCTAssertEqual(bh, 44.0)
    }

}
