//
//  Optional+RGAppTools.swift
//  RGAppTools
//
//  Created by RAIN on 2019/5/28.
//  Copyright © 2019 Smartech. All rights reserved.
//

import UIKit

extension Optional where Wrapped == String {
    /// 判断字符串是否为 nil
    public var rat_isBlank: Bool {
        return self?.rat_isBlank ?? true
    }
}
