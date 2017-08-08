//
//  Double+RGAppTools.swift
//  RGAppTools
//
//  Created by RAIN on 16/2/2.
//  Copyright © 2016年 Smartech. All rights reserved.
//

import Foundation

//  MARK: Angle transform
extension Double {
    /// 角度转化为弧度
    public var rat_radian: Double {
        return (.pi * self) / 180.0
    }

    /// 弧度转化为角度
    public var rat_angle: Double {
        return (180.0 * self) / .pi
    }
}

//  MARK: Formatted Output
extension Double {
    /**
     格式化输出

     - parameter fmt: 以字符串形式表示的输出格式

     - returns: 格式化输出结果
     */
    public func rat_format(_ fmt: String) -> String {
        return String(format: "%\(fmt)f", self)
    }
}
