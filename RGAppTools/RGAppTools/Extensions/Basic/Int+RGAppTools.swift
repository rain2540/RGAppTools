//
//  Int+RGAppTools.swift
//  RGAppTools
//
//  Created by RAIN on 16/2/2.
//  Copyright © 2016年 Smartech. All rights reserved.
//

import UIKit

extension Int {
    public var rat: IntExtension {
        return IntExtension(int: self)
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
