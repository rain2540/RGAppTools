//
//  Optional+RGAppTools.swift
//  RGAppTools
//
//  Created by RAIN on 2019/5/28.
//  Copyright © 2019 Smartech. All rights reserved.
//

import UIKit

infix operator ???: NilCoalescingPrecedence
public func ???<T>(optional: T?, defaultValue: @autoclosure () -> String) -> String {
  switch optional {
  case let value?:
    return String(describing: value)

  case nil:
    return defaultValue()
  }
}


/// 执行 `do` 或返回异常信息
/// - Parameter do: 执行的操作
/// - Returns: 异常信息
public func should(_ do: () throws -> Void) -> Error? {
  do {
    try `do`()
    return nil
  } catch {
    return error
  }
}


// MARK: - Emptiness

extension Optional {

  /// 判断可选值是否为空
  public var rat_isNone: Bool {
    switch self {
    case .none:
      return true

    case .some:
      return false
    }
  }

  /// 判断可选值是否非空
  public var rat_isSome: Bool {
    return !rat_isNone
  }

}


// MARK: - Or

extension Optional {

  /// 返回可选值或默认值
  /// - Parameter default: 可选值为空时返回的默认值
  public func rat_or(_ default: Wrapped) -> Wrapped {
    return self ?? `default`
  }

  /// 返回可选值或 `else` 表达式的返回值
  /// - Parameter else: 可选值为空时返回的表达式
  public func rat_or(else: @autoclosure () -> Wrapped) -> Wrapped {
    return self ?? `else`()
  }

  /// 返回可选值或者 `else` 闭包的返回值
  /// - Parameter else: 可选值为空时返回的闭包
  public func rat_or(else: () -> Wrapped) -> Wrapped {
    return self ?? `else`()
  }

  /// 当可选值不为空时，返回可选值；如果为空，抛出异常
  /// - Parameter exception: 可选值为空时抛出的异常
  public func rat_or(throw exception: Error) throws -> Wrapped {
    guard let unwrapped = self else { throw exception }
    return unwrapped
  }

}


// MARK: - Error

extension Optional where Wrapped == Error {

  /// 当 Error 不为空时，执行 `else`
  /// - Parameter else: Error 不为空时执行的操作
  public func rat_or(else: (Error) -> Void) {
    guard let error = self else { return }
    `else`(error)
  }

}


// MARK: - Map

extension Optional {

  /// 可选值变换返回，如果可选值为空，则返回默认值
  /// - Parameters:
  ///   - fn: 映射值的闭包
  ///   - default: 可选值为空时，将作为返回值
  /// - Throws: 抛出的异常信息
  /// - Returns: 变换后的结果
  public func rat_map<T>(_ fn: (Wrapped) throws -> T, default: T) rethrows -> T {
    return try map(fn) ?? `default`
  }

  /// 可选值变换返回，如果可选值为空，则调用 `else` 闭包
  /// - Parameters:
  ///   - fn: 映射值的闭包
  ///   - else: 可选值为空时，调用的闭包
  /// - Throws: 抛出的异常信息
  /// - Returns: 变换后的结果
  public func rat_map<T>(_ fn: (Wrapped) throws -> T, else: () throws -> T) rethrows -> T {
    return try map(fn) ?? `else`()
  }

}


// MARK: - Combining Optionals

extension Optional {

  /// 当可选值不为空时，解包并返回参数 `optional`
  /// - Parameter optional: 可选值不为空时，返回的值
  public func rat_and<T>(_ optional: T?) -> T? {
    guard self != nil else { return nil }
    return optional
  }

  /// 解包可选值，当可选值不为空时，执行 `then` 闭包，并返回执行结果
  /// 可以将多个可选项连接在一起
  /// - Parameter then: 可选值不为空时，执行的操作
  public func rat_and<T>(then: (Wrapped) throws -> T?) rethrows -> T? {
    guard let unwrapped = self else { return nil }
    return try then(unwrapped)
  }

  /// 将当前可选值与其他可选值组合在一起。当且仅当两个可选值都不为空时组合成功，否则返回空。
  /// - Parameter other: 其他可选值
  public func rat_zip2<T>(with other: Optional<T>) -> (Wrapped, T)? {
    guard let first = self, let second = other else { return nil }
    return (first, second)
  }

  /// 将当前可选值与其他可选值组合在一起。当且仅当三个可选值都不为空时组合成功，否则返回空。
  /// - Parameters:
  ///   - other: 第二个可选值
  ///   - another: 第三个可选值
  public func rat_zip3<A, B>(with other: Optional<A>, another: Optional<B>) -> (Wrapped, A, B)? {
    guard let first = self,
          let second = other,
          let third = another else { return nil }
    return (first, second, third)
  }

}


extension Optional {

  /// 当可选值不为空时，执行 `some` 闭包
  /// - Parameter some: 可选值不为空时，执行的操作
  public func rat_on(some: () throws -> Void) rethrows {
    if self != nil { try some() }
  }

  /// 当可选值为空时，执行 `none` 闭包
  /// - Parameter none: 可选值为空时，执行的操作
  public func rat_on(none: () throws -> Void) rethrows {
    if self == nil { try none() }
  }

}


// MARK: - Various

extension Optional {

  /// 可选值不为空且可选值满足 `predicate` 条件才返回，否则返回 `nil`
  /// - Parameter predicate: 判断条件
  public func rat_filter(_ predicate: (Wrapped) -> Bool) -> Wrapped? {
    guard let unwrapped = self, predicate(unwrapped) else { return nil }
    return self
  }

  /// 可选值不为空时返回，否则 crash可选值为空
  /// - Parameter message: 可选值为空时的 crash 信息
  public func rat_expect(_ message: String) -> Wrapped {
    guard let value = self else { fatalError(message) }
    return value
  }

}


// MARK: - String

extension Optional where Wrapped == String {

  /// 判断字符串是否为 nil, 为空, 或只包括空字符
  public var rat_isBlank: Bool {
    return self?.rat_isBlank ?? true
  }

}
