//
//  NSObject+RGAppTools.swift
//  RGAppTools
//
//  Created by RAIN on 16/5/7.
//  Copyright © 2016年 Smartech. All rights reserved.
//

import Foundation

extension RGAppTools where Base: NSObject {
    /// Object 对应的 JSON 字符串
    public var jsonString: String? {
        do {
            let data = try JSONSerialization.data(withJSONObject: base, options: .prettyPrinted)
            return String(data: data, encoding: String.Encoding.utf8)
        } catch let error as NSError {
            print("RGAppTools NSObject to JSON string Error:\n", error)
            return nil
        }
    }
}
