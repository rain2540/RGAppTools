//
//  Decimal+RGAppTools.swift
//  RGAppTools
//
//  Created by RAIN on 2022/9/7.
//  Copyright © 2022 Smartech. All rights reserved.
//

import Foundation

extension Decimal {

  public var rat: DecimalExtension {
    return DecimalExtension(decimal: self)
  }

}


// MARK: -

public struct DecimalExtension {

  private var decimal: Decimal

  fileprivate init(decimal: Decimal) {
    self.decimal = decimal
  }

}


// MARK: - Formatted Output

extension DecimalExtension {

  /// 格式化输出字符串
  /// - Parameter format: 以字符串形式表示的输出格式
  /// - Returns: 格式化输出结果
  public func string(format: String) -> String {
    let doubleValue = Double(truncating: decimal as NSNumber)
    return String(format: "%\(format)f", doubleValue)
  }

}
