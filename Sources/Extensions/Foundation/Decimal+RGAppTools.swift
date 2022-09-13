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

  public static var rat: DecimalExtension.Type {
    return DecimalExtension.self
  }

}


// MARK: -

public struct DecimalExtension {

  private var decimal: Decimal

  fileprivate init(decimal: Decimal) {
    self.decimal = decimal
  }

}


// MARK: - Create

extension DecimalExtension {

  /// 依据给出的字符串，创建 Decimal 值
  /// - Parameters:
  ///   - string: 将要转换为 Decimal 值的字符串
  public static func create(
    string: String,
    defaultValue: Double = 0.0) -> Decimal
  {
    let value = Decimal(string: string) ?? Decimal(string: "\(defaultValue)")!
    return value
  }

  /// 依据给出的字符串，及小数截取位数，创建 Decimal 值
  /// - Parameters:
  ///   - string: 将要转换为 Decimal 值的字符串
  ///   - scale: 保留的小数位数，默认为 2
  ///   - defaultValue: 如果创建失败，给定的默认值，默认为 0
  /// - Returns: 依据字符串创建的 Decimal 值
  public static func value(
    string: String,
    scale: Int = 2,
    defaultValue: Double = 0.0) -> Decimal
  {
    var valueString = string
    if let pointIndex = string.firstIndex(of: ".") {
      let edge = string.index(before: string.endIndex)
      let end = string.index(
        string.startIndex,
        offsetBy: pointIndex.utf16Offset(in: string) + scale,
        limitedBy: edge
      ) ?? edge
      valueString = String(string.prefix(through: end))
    }
    let value = create(string: valueString, defaultValue: defaultValue)
    return value
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
