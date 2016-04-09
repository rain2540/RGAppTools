//
//  NSUserDefaults+Extension.swift
//  RGAppTools
//
//  Created by RAIN on 16/2/5.
//  Copyright © 2016年 Smartech. All rights reserved.
//

import Foundation

extension NSUserDefaults {
    /**
     检验UserDefaults中是否存在某个key
     
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
    
    /**
     将某个 key - Object 值存入UserDefaults中
     
     - parameter object: 将要存入的 object
     - parameter key:    将要存入的 key
     */
    public func saveObject(object: AnyObject, forKey key: String) {
        self.setObject(object, forKey: key)
        self.synchronize()
    }
    
    //  TODO: Add comment
    public func saveDouble(value: Double, forKey key: String) {
        self.setDouble(value, forKey: key)
        self.synchronize()
    }
}
