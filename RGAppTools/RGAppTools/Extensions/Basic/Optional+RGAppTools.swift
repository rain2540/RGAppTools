//
//  Optional+RGAppTools.swift
//  RGAppTools
//
//  Created by RAIN on 2019/5/28.
//  Copyright © 2019 Smartech. All rights reserved.
//

import UIKit

extension Optional {
    public var isNone: Bool {
        switch self {
        case .none:
            return true

        case .some:
            return false
        }
    }

    public var isSome: Bool {
        return !isNone
    }
}


extension Optional where Wrapped == String {
    /// 判断字符串是否为 nil, 为空, 或只包括空字符
    public var rat_isBlank: Bool {
        return self?.rat_isBlank ?? true
    }
}
