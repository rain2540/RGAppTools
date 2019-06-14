//
//  Optional+RGAppTools.swift
//  RGAppTools
//
//  Created by RAIN on 2019/5/28.
//  Copyright © 2019 Smartech. All rights reserved.
//

import UIKit

public func should(_ do: () throws -> Void) -> Error? {
    do {
        try `do`()
        return nil
    } catch {
        return error
    }
}

extension Optional {
    public var rat_isNone: Bool {
        switch self {
        case .none:
            return true

        case .some:
            return false
        }
    }

    public var rat_isSome: Bool {
        return !rat_isNone
    }

    public func rat_or(_ default: Wrapped) -> Wrapped {
        return self ?? `default`
    }

    public func rat_or(else: @autoclosure () -> Wrapped) -> Wrapped {
        return self ?? `else`()
    }

    public func rat_or(else: () -> Wrapped) -> Wrapped {
        return self ?? `else`()
    }

    public func rat_or(throw exception: Error) throws -> Wrapped {
        guard let unwrapped = self else { throw exception }
        return unwrapped
    }
}


extension Optional where Wrapped == Error {
    public func rat_or(else: (Error) -> Void) {
        guard let error = self else { return }
        `else`(error)
    }
}


extension Optional where Wrapped == String {
    /// 判断字符串是否为 nil, 为空, 或只包括空字符
    public var rat_isBlank: Bool {
        return self?.rat_isBlank ?? true
    }
}
