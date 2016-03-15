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
    
}
