//
//  UserDefaults+RGAppTools.swift
//  RGAppTools
//
//  Created by RAIN on 16/2/5.
//  Copyright © 2016-2017 Smartech. All rights reserved.
//

import Foundation


public final class Key<ValueType: Codable> {

  fileprivate let key: String
  public init(_ key: String) {
    self.key = key
  }

}


// MARK: -

extension RGAppTools where Base: UserDefaults {

  // MARK: Public

  /// 检验 UserDefaults 中是否存在某个 key
  /// ```
  /// // How to use
  /// UserDefaults.standard.rat.has(Key<TypeName>("key"))
  /// ```
  /// - Parameter key: 待检验的 key
  /// - Returns: 检验结果
  public func has<ValueType>(_ key: Key<ValueType>) -> Bool {
    return base.value(forKey: key.key) != nil
  }

  /// 获取 key 值对应的内容
  /// ```
  /// // How to use
  /// UserDefaults.standard.rat.value(Key<TypeName>("key"))
  /// ```
  /// - Parameter key: 标记内容的 key
  /// - Returns: key 对应的内容
  public func value<ValueType>(for key: Key<ValueType>) -> ValueType? {
    if isPrimitive(type: ValueType.self) {
      return base.value(forKey: key.key) as? ValueType
    }

    guard let data = base.data(forKey: key.key) else { return nil }

    do {
      let decoder = JSONDecoder()
      let result = try decoder.decode(ValueType.self, from: data)
      return result
    } catch {
#if DEBUG
      print(error)
#endif
    }
    return nil
  }

  /// 将内容存入 UserDefaults, 并用 key 标记
  /// ```
  /// // How to use
  /// UserDefaults.standard.rat.save(value, for: Key<TypeName>("key"))
  /// ```
  /// - Parameters:
  ///   - value: 将要存入的内容
  ///   - key: 用于标记的 key
  public func save<ValueType>(_ value: ValueType, for key: Key<ValueType>) {
    if isPrimitive(type: ValueType.self) {
      base.set(value, forKey: key.key)
      base.synchronize()
      return
    }

    do {
      let encoder = JSONEncoder()
      let result = try encoder.encode(value)
      base.set(result, forKey: key.key)
      base.synchronize()
    } catch {
#if DEBUG
      print(error)
#endif
    }
  }

  /// 清除 key 值对应内容
  /// ```
  /// // How to use
  /// UserDefaults.standard.rat.clear(Key<TypeName>("key"))
  /// ```
  /// - Parameter key: 标记内容的 key
  public func clear<ValueType>(for key: Key<ValueType>) {
    base.set(nil, forKey: key.key)
    base.synchronize()
  }


  // MARK: - Private

  /// 检验给定类型是否为基础类型
  /// - Parameter type: 待检验的类型
  /// - Returns: 检验结果
  private func isPrimitive<ValueType>(type: ValueType.Type) -> Bool {
    switch type {
    case is String.Type, is Bool.Type, is Int.Type, is Float.Type, is Double.Type:
      return true
    default:
      return false
    }
  }

}
