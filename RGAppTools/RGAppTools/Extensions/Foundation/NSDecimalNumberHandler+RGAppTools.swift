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
