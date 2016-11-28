//
//  UserDefaults+RGAppTools.swift
//  RGAppTools
//
//  Created by RAIN on 16/2/5.
//  Copyright © 2016年 Smartech. All rights reserved.
//

import Foundation

//  MARK: Savings
extension UserDefaults {
    /**
     将某个 key - Object 值存入 UserDefaults 中
     
     - parameter object: 将要存入的 object
     - parameter key:    将要存入的 key
     */
    public func saveObject(_ object: Any?, forKey key: String) {
        self.set(object, forKey: key)
        self.synchronize()
    }

    /**
     将某个 key - Bool 值存入 UserDefaults 中
     
     - parameter value: 将要存入的 Bool 值
     - parameter key:   将要存入的 key
     */
    public func saveBool(_ value: Bool, forKey key: String) {
        self.set(value, forKey: key)
        self.synchronize()
    }
    
    /**
     将某个 key - Double 值存入 UserDefaults 中
     
     - parameter value: 将要存入的 Double 值
     - parameter key:   将要存入的 key
     */
    public func saveDouble(_ value: Double, forKey key: String) {
        self.set(value, forKey: key)
        self.synchronize()
    }
}

//  MARK: Check key exist or not
extension UserDefaults {
    /**
     检验 UserDefaults 中是否存在某个 key

     - parameter key: 待检验的 key

     - returns: 检验结果
     */
    public func isHaveKey(key: String) -> Bool {
        let userDefaultsDic = self.dictionaryRepresentation() as NSDictionary
        let keys = userDefaultsDic.allKeys

        for i in 0 ..< keys.count {
            let aKey = keys[i] as? String
            if key == aKey {
                return true
            }
        }
        return false
    }
}
