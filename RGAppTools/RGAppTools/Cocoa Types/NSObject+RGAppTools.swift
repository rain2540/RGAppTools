//
//  NSObject+RGAppTools.swift
//  RGAppTools
//
//  Created by RAIN on 16/5/7.
//  Copyright © 2016年 Smartech. All rights reserved.
//

import Foundation

//  MARK: Transform to JSON String
extension NSObject {
    /**
     将 Object 转换为 JSON 字符串
     
     - returns: 转换得到的 JSON 字符串
     */
    public static func rg_objectToJSONString() -> String? {
        do {
            let data = try NSJSONSerialization.dataWithJSONObject(self, options: .PrettyPrinted)
            return NSString(data: data, encoding: NSUTF8StringEncoding) as? String
        } catch let error as NSError {
            print("RGAppTools NSObject to JSON string Error:\n", error)
            return nil
        }
    }
}
