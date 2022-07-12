//
//  DictionaryExtensionTests.swift
//  RGAppToolsTests
//
//  Created by RAIN on 2020/6/3.
//  Copyright © 2020 Smartech. All rights reserved.
//

import XCTest
@testable import RGAppTools

class DictionaryExtensionTests: XCTestCase {

  func testHasKey() {
    let dic = ["1": "One"]
    XCTAssertEqual(dic.rat_has(key: "1"), true)
    XCTAssertEqual(dic.rat_has(key: "2"), false)
    XCTAssertEqual(dic.rat_hasValue(forKey: "1"), true)
    XCTAssertEqual(dic.rat_hasValue(forKey: "2"), false)
  }

}
