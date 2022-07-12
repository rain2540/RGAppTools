//
//  ArrayExtensionTests.swift
//  RGAppToolsTests
//
//  Created by RAIN on 2022/7/12.
//  Copyright © 2022 Smartech. All rights reserved.
//

import XCTest
@testable import RGAppTools

class ArrayExtensionTests: XCTestCase {

  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }

  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }

  func testExample() throws {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    // Any test you write for XCTest can be annotated as throws and async.
    // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
    // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    var array = [0, 1, 2, 3, 4,]

    print(array[0, 1, 3])
    print(array[guarded: 4] ??? "can not get array[guarded: 4]")
    print(array[guarded: 5] ??? "the value of array[guarded: 5] is nil")

    XCTAssertEqual(array[0, 1, 3], [0, 1, 3])
    XCTAssertEqual(array[guarded: 4], 4)
    XCTAssertEqual(array[guarded: 5], nil)

    array[0, 2, 4] = [5, 6, 7]
    print(array)
  }

  func testPerformanceExample() throws {
    // This is an example of a performance test case.
    self.measure {
      // Put the code you want to measure the time of here.
    }
  }

}
