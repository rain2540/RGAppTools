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


// MARK: -

public struct IntExtension {

    private var int: Int

    fileprivate init(int: Int) {
        self.int = int
    }

}


//  MARK: - Farmatted Output

extension IntExtension {

    /// 格式化输出
    /// - Parameter fmt: 以字符串形式表示的输出格式
    /// - Returns: 格式化输出结果
    public func format(_ fmt: String) -> String {
        return String(format: "%\(fmt)d", int)
    }

}


//  MARK: - Transfer

extension IntExtension {

    /// 转换为对应的 CGFloat 值
    public var cgFloatValue: CGFloat {
        return CGFloat(int)
    }

}


// MARK: - Random Number

extension IntExtension {

    /// 创建 lower - upper 之间的一个随机数
    /// - Parameter lower: 范围下限
    /// - Parameter upper: 范围上限
    /// - Returns: 获取到的随机数
    public static func randomNumber(lower: Int = 0,
                                    upper: Int = Int(UInt32.max)) -> Int
    {
        return lower + Int(arc4random_uniform(UInt32(upper - lower)))
    }

    /// 创建 range 范围内的一个随机数
    /// - Parameter range: 产生随机数的范围
    /// - Returns: 获取到的随机数
    public static func randomNumber(range: Range<Int>) -> Int {
        return randomNumber(lower: range.lowerBound, upper: range.upperBound)
    }

    /// 创建 lower - upper 之间的若干个随机数
    /// - Parameters:
    ///   - lower: 范围下限
    ///   - upper: 范围上限
    ///   - size: 随机数个数
    /// - Returns: 获取到的随机数数组
    public static func randomNumbers(
        lower: Int = 0,
        upper: Int = Int(UInt32.max),
        size: Int = 10) -> [Int]
    {
        var res: [Int] = []
        for _ in 0 ..< size {
            res.append(randomNumber(lower: lower, upper: upper))
        }
        return res
    }
    
    /// 创建 range 范围内的若干个随机数
    /// - Parameters:
    ///   - range: 产生随机数的范围
    ///   - size: 随机数个数
    /// - Returns: 获取到的随机数数组
    public static func randomNumbers(range: Range<Int>,
                                     size: Int = 10) -> [Int]
    {
        var res: [Int] = []
        for _ in 0 ..< size {
            res.append(randomNumber(range: range))
        }
        return res
    }

}
