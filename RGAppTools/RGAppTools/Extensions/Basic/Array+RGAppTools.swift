//
//  Array+RGAppTools.swift
//  RGAppTools
//
//  Created by RAIN on 2019/1/7.
//  Copyright © 2019 Smartech. All rights reserved.
//

import Foundation

extension Array {
    subscript(input: [Int]) -> ArraySlice<Element> {
        get {
            var result = ArraySlice<Element>()
            for i in input {
                assert(i < self.count, "Index is out of range")
                result.append(self[i])
            }
            return result
        }

        set {
            for (index, i) in input.enumerated() {
                assert(i < self.count, "Index is out of range")
                self[i] = newValue[index]
            }
        }
    }
}
