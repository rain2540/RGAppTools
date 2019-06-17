//
//  Optional+RGAppTools.swift
//  RGAppTools
//
//  Created by RAIN on 2019/5/28.
//  Copyright © 2019 Smartech. All rights reserved.
//

import UIKit

/// 执行 `do` 或抛出异常
/// - Parameter do: 执行的操作
public func should(_ do: () throws -> Void) -> Error? {
    do {
        try `do`()
        return nil
    } catch {
        return error
    }
}


// MARK: -
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


// MARK: - String
extension Optional where Wrapped == String {
    /// 判断字符串是否为 nil, 为空, 或只包括空字符
    public var rat_isBlank: Bool {
        return self?.rat_isBlank ?? true
    }
}
