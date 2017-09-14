//
//  NSDictionary+RGAppTools.swift
//  RGAppTools
//
//  Created by RAIN on 16/2/5.
//  Copyright © 2016年 Smartech. All rights reserved.
//

import Foundation

extension RGAppTools where Base: NSDictionary {
    /// 检验 NSDictionary 中是否存在某个 key
    ///
    /// - Parameter key: 待检验的 key
    /// - Returns: 检验结果的布尔值
    func isHave(key: String) -> Bool {
       return base.value(forKey: key) != nil
    }
}

//  MARK: Main Bundle
extension NSDictionary {
    /**
     获取 Main Bundle 中某个文件的内容, 创建为 NSDictionary
     
     - parameter name: 文件名
     - parameter ext:  文件扩展名
     
     - returns: 文件路径
     */
    convenience init?(mainBundlePathForResource name: String?, ofType ext: String?) {
        guard let path = Bundle.main.path(forResource: name, ofType: ext) else {
            print("RGApptools: NSDictionary init with main bundle path for resource of type is nil")
            return nil
        }
        self.init(contentsOfFile: path)
    }
}

//  MARK: Check key exist or not
extension NSDictionary {
    /**
     检验 NSDictionary 中是否存在某个 key
     
     - parameter key: 待检验的 key
     
     - returns: 检验结果的布尔值
     */
    @available(*, deprecated, message: "Extensions directly on NSDictionary are deprecated. Use `NSDictionary.rat.isHave(key:)` instead.", renamed: "rat.isHave(key:)")
    func rat_isHaveKey(_ key: String) -> Bool {
        let keys = self.allKeys as! [String]
        for aKey: String in keys {
            if key == aKey {
                return true
            }
        }
        return false
    }
}
