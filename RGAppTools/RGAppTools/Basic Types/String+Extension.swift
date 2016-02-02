//
//  String+Extension.swift
//  RGCommonTools
//
//  Created by RAIN on 16/1/25.
//  Copyright © 2016年 Smartech. All rights reserved.
//

import Foundation

extension String {
    /**
     清除 nil 和 NSNull 对象，并返回字符串
     
     - parameter obj: 未经处理的对象(NSObject)
     
     - returns: 经处理后的字符串
     */
    static func stringWithoutNull(obj: NSObject?) -> String {
        guard let obj = obj else {
            return ""
        }
        
        if obj.isKindOfClass(NSNull.classForCoder()) {
            return ""
        } else {
            return "\(obj)"
        }
    }
}
