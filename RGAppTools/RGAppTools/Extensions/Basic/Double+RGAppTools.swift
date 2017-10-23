//
//  Double+RGAppTools.swift
//  RGAppTools
//
//  Created by RAIN on 16/2/2.
//  Copyright © 2016-2017 Smartech. All rights reserved.
//

import Foundation

extension Double {
    public var rat: DoubleExtension {
        return DoubleExtension(double: self)
    }
}

public struct DoubleExtension {
    private var double: Double
    fileprivate init(double: Double) {
        self.double = double
    }

    //  MARK: Angle transform
    /// 角度转化为弧度
    public var radian: Double {
        return (Double.pi * double) / 180.0
    }

    /// 弧度转化为角度
    public var angle: Double {
        return (180.0 * double) / Double.pi
    }

    //  MARK: Formatted Output
    /// 格式化输出
    ///
    /// - Parameter fmt: 以字符串形式表示的输出格式
    /// - Returns: 格式化输出结果
    public func format(_ fmt: String) -> String {
        return String(format: "%\(fmt)f", double)
    }
}
