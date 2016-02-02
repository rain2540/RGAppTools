//
//  Int+Extension.swift
//  RGAppTools
//
//  Created by RAIN on 16/2/2.
//  Copyright © 2016年 Smartech. All rights reserved.
//

import UIKit

extension Int {
    /**
     格式化输出
     
     - parameter fmt: 以字符串形式表示的输出格式
     
     - returns: 格式化输出结果
     */
    public func format(fmt: String) -> String {
        return String(format: "%\(fmt)d", self)
    }
}

extension Int {
    /// Transfer to CGFloat
    public var CGFloatValue: CGFloat {
        return CGFloat(self)
    }
}
