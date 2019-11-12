//
//  NSDecimalNumberHandler+RGAppTools.swift
//  RGAppTools
//
//  Created by RAIN on 2019/11/8.
//  Copyright © 2019 Smartech. All rights reserved.
//

import Foundation

extension RGAppTools where Base: NSDecimalNumberHandler {

    public static var defaultBehavior: NSDecimalNumberHandler {
        return NSDecimalNumberHandler(scale: 2)
    }

}


extension NSDecimalNumberHandler {

    /// 构建Decimal Number Handler
    /// - Parameter numberRoundingMode: 舍入模式，默认为四舍五入
    /// - Parameter scale: 保留小数位数
    /// - Parameter exact: 精度错误处理
    /// - Parameter overflow: 上限越界处理
    /// - Parameter underflow: 下限越界处理
    /// - Parameter divideByZero: 除以零的处理
    convenience init(
        numberRoundingMode: NSDecimalNumber.RoundingMode = .plain,
        scale: Int16,
        raiseOnExactness exact: Bool = false,
        raiseOnOverflow overflow: Bool = false,
        raiseOnUnderflow underflow: Bool = false,
        raiseOnDivideByZero divideByZero: Bool = false)
    {
        self.init(
            roundingMode: numberRoundingMode,
            scale: scale,
            raiseOnExactness: exact,
            raiseOnOverflow: overflow,
            raiseOnUnderflow: underflow,
            raiseOnDivideByZero: divideByZero
        )
    }

}
