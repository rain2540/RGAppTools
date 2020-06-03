//
//  Dictionary+RGAppTools.swift
//  RGAppTools
//
//  Created by RAIN on 2017/9/8.
//  Copyright © 2017年 Smartech. All rights reserved.
//

import Foundation

extension Dictionary {

    /// 检验 Dictionary 中是否存在某个 key
    /// - Parameter key: 待检验的 key
    /// - Returns: 检验结果的布尔值
    public func rat_has(key: Key) -> Bool {
        for aKey in self.keys {
            if key == aKey {
                return true
            }
        }
        return false
    }

    public func rat_hasValue(forKey key: Key) -> Bool {
        return self[key] != nil
    }

}
