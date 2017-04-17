//
//  Int+RGAppTools.swift
//  RGAppTools
//
//  Created by RAIN on 16/2/2.
//  Copyright © 2016年 Smartech. All rights reserved.
//

import UIKit

//  MARK: Farmatted Output
extension Int {
    /**
     格式化输出
     
     - parameter fmt: 以字符串形式表示的输出格式
     
     - returns: 格式化输出结果
     */
    public func rg_format(_ fmt: String) -> String {
        return String(format: "%\(fmt)d", self)
    }
}

//  MARK: Transfer
extension Int {
    /// Transfer to CGFloat
    public var rat_CGFloatValue: CGFloat {
        return CGFloat(self)
    }
}
