//
//  NSUserDefaults+RGAppTools.swift
//  RGAppTools
//
//  Created by RAIN on 16/2/5.
//  Copyright © 2016年 Smartech. All rights reserved.
//

import Foundation

//  TODO: Add MARK: for this extension of NSUserDefaults
//  TODO: change this extension to "Savings"
extension NSUserDefaults {
    /**
     检验 UserDefaults 中是否存在某个 key
     
     - parameter key: 待检验的 key
     
     - returns: 检验结果
     */

    
    /**
     将某个 key - Object 值存入 UserDefaults 中
     
     - parameter object: 将要存入的 object
     - parameter key:    将要存入的 key
     */
    public func saveObject(object: AnyObject, forKey key: String) {
        self.setObject(object, forKey: key)
        self.synchronize()
    }

    /**
     将某个 key - Bool 值存入 UserDefaults 中
     
     - parameter value: 将要存入的 Bool 值
     - parameter key:   将要存入的 key
     */
    public func saveBool(value: Bool, forKey key: String) {
        self.setBool(value, forKey: key)
        self.synchronize()
    }
    
    /**
     将某个 key - Double 值存入 UserDefaults 中
     
     - parameter value: 将要存入的 Double 值
     - parameter key:   将要存入的 key
     */
    public func saveDouble(value: Double, forKey key: String) {
        self.setDouble(value, forKey: key)
        self.synchronize()
    }
}

//  TODO: Add MARK: for this extension of NSUserDefaults
//  TODO: change this extension to check key exist or not
extension NSUserDefaults {
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
