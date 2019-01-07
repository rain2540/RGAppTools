//
//  Array+RGAppTools.swift
//  RGAppTools
//
//  Created by RAIN on 2019/1/7.
//  Copyright © 2019 Smartech. All rights reserved.
//

import Foundation

extension Array {

    subscript(first: Int, second: Int, others: Int...) -> ArraySlice<Element> {
        get {
            var indexes: [Int] = []
            indexes.append(contentsOf: [first, second])
            indexes.append(contentsOf: others)

            var result = ArraySlice<Element>()
            for i in indexes {
                assert(i < self.count, "Index is out of range")
                result.append(self[i])
            }
            return result
        }

        set {
            var indexes: [Int] = []
            indexes.append(contentsOf: [first, second])
            indexes.append(contentsOf: others)

            for (index, i) in indexes.enumerated() {
                assert(i < self.count, "Index is out of range")
                self[i] = newValue[index]
            }
        }
    }

    /// 获取数组特定位置的元素 / 设置数组特定元素的值
    ///
    /// - Parameter input: 特定元素的下标组成的数组
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
