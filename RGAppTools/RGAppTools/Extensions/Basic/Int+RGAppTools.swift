//
//  Int+RGAppTools.swift
//  RGAppTools
//
//  Created by RAIN on 16/2/2.
//  Copyright © 2016-2017 Smartech. All rights reserved.
//

import UIKit

extension Int {
    public var rat: IntExtension {
        return IntExtension(int: self)
    }
    
    public static var rat: IntExtension.Type {
        return IntExtension.self
    }
}

public struct IntExtension {
    private var int: Int

    fileprivate init(int: Int) {
        self.int = int
    }

    //  MARK: Farmatted Output
    /// 格式化输出
    ///
    /// - Parameter fmt: 以字符串形式表示的输出格式
    /// - Returns: 格式化输出结果
    public func format(_ fmt: String) -> String {
        return String(format: "%\(fmt)d", int)
    }

    //  MARK: Transfer
    /// 转换为对应的 CGFloat 值
    public var cgFloatValue: CGFloat {
        return CGFloat(int)
    }
}

extension IntExtension {
    public static func randomNumber(lower: Int = 0, upper: Int = Int(UInt32.max)) -> Int {
        return lower + Int(arc4random_uniform(UInt32(upper - lower)))
    }
    
    public static func randomNumber(range: Range<Int>) -> Int {
        return randomNumber(lower: range.lowerBound, upper: range.upperBound)
    }
    
    public static func randomNumbers(lower: Int = 0, upper: Int = Int(UInt32.max), size: Int = 10) -> [Int] {
        var res: [Int] = []
        for _ in 0 ..< size {
            res.append(randomNumber(lower: lower, upper: upper))
        }
        return res
    }
    
    public static func randomNumbers(range: Range<Int>, size: Int = 10) -> [Int] {
        var res: [Int] = []
        for _ in 0 ..< size {
            res.append(randomNumber(range: range))
        }
        return res
    }
}
