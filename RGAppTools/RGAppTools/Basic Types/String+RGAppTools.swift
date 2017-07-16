//
//  String+RGAppTools.swift
//  RGAppTools
//
//  Created by RAIN on 16/2/2.
//  Copyright © 2016年 Smartech. All rights reserved.
//

import UIKit

infix operator >
func > (_ lh: String, _ rh: String) -> Bool {
    return lh.compare(rh, options: .numeric) == .orderedDescending
}

infix operator >=
func >= (_ lh: String, _ rh: String) -> Bool {
    return lh.compare(rh, options: .numeric) != .orderedAscending
}

infix operator <
func < (_ lh: String, _ rh: String) -> Bool {
    return lh.compare(rh, options: .numeric) == .orderedAscending
}

infix operator <=
func <= (_ lh: String, _ rh: String) -> Bool {
    return lh.compare(rh, options: .numeric) != .orderedDescending
}

//  MARK: Clear nil
extension String {
    /**
     清除 nil 和 NSNull 对象，并返回字符串
     
     - parameter obj: 未经处理的对象
     
     - returns: 经处理后的字符串
     */
    public static func rat_stringWithoutNull(_ obj: AnyObject?) -> String {
        guard let obj = obj else {
            return ""
        }
        
        if obj is NSNull {
            return ""
        } else if obj is NSNumber {
            return "\(obj)"
        } else {
            return "\(obj)"
        }
    }
}

//  MARK: Size
extension String {
    /**
     返回按照给定字体绘制时, 字符串所占有的边界大小
     
     - parameter font: 要应用于字符串的字体
     
     - returns: 按照给定字体绘制时, 字符串所占有的边界大小
     */
    public func rat_sizeWithFont(_ font: UIFont) -> CGSize {
        return (self as NSString).size(attributes: [NSFontAttributeName: font])
    }
    
    /**
     返回按照给定属性绘制时, 字符串所占有的边界大小
     
     - parameter attrs: 要应用于字符串的文本属性的字典
     
     - returns: 按照给定属性绘制时, 字符串所占有的边界大小
     */
    public func rat_sizeWithAttributes(_ attrs: [String: AnyObject]?) -> CGSize {
        return (self as NSString).size(attributes: attrs)
    }
}

//  MARK: Trans
extension String {
    /**
     返回 String 对应的 Boolean 值
     
     - returns: String 对应的 Boolean 值
     */
    public func rat_boolValue() -> Bool {
        return (self as NSString).boolValue
    }
    
    /**
     返回 String 对应的 Int 值
     
     - returns: String 对应的 Int 值
     */
    public func rat_intValue() -> Int? {
        return Int(self)
    }
    
    /**
     返回 String 对应的 Float 值
     
     - returns: String 对应的 Float 值
     */
    public func rat_floatValue() -> Float? {
        return Float(self)
    }
    
    /**
     返回 String 对应的 Double 值
     
     - returns: String 对应的 Double 值
     */
    public func rat_doubleValue() -> Double? {
        return Double(self)
    }

    /**
     将字符串转换为 JSON 对象

     - returns: 转换得到的 JSON 对象
     */
    public func rat_toObject() -> AnyObject? {
        let string = self.replacingOccurrences(of: "\0", with: "")
        guard let data = string.data(using: String.Encoding.utf8) else {
            print("RGAppTools String to object Error:\n", "Fail to get data")
            return nil
        }
        do {
           return try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as AnyObject?
        } catch let error as NSError {
            print("RGAppTools String to object Error:\n", error)
            return nil
        }
    }
}

//  MARK: Main Bundle
extension String {
    /**
     获取 Main Bundle 中的文件路径
     
     - parameter name: 文件名
     - parameter ext:  文件后缀名
     
     - returns: Main Bundle 中文件的路径
     */
    public static func rg_pathForResourceInMainBundle(_ name: String?, ofType ext: String?) -> String? {
        return Bundle.main.path(forResource: name, ofType: ext)
    }
    
    /**
     获取 Main Bundle 中文件内的字符串
     
     - parameter name: 文件名
     - parameter ext:  文件后缀名
     
     - returns: Main Bundle 中文件内的字符串
     */
    public init?(pathForResource name: String?, ofType ext: String?) {
        guard let path = Bundle.main.path(forResource: name, ofType: ext) else {
            print("RGBring :: String init with path for resource of type error: path is nil")
            return nil
        }
        try? self.init(contentsOfFile: path)
    }
}
