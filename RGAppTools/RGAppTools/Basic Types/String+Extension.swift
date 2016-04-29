//
//  String+Extension.swift
//  RGAppTools
//
//  Created by RAIN on 16/2/2.
//  Copyright © 2016年 Smartech. All rights reserved.
//

import UIKit

//  MARK: Clear nil
extension String {
    /**
     清除 nil 和 NSNull 对象，并返回字符串
     
     - parameter obj: 未经处理的对象
     
     - returns: 经处理后的字符串
     */
    static func rg_stringWithoutNull(obj: AnyObject?) -> String {
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
    public func rg_sizeWithFont(font: UIFont) -> CGSize {
        return (self as NSString).sizeWithAttributes([NSFontAttributeName: font])
    }
    
    /**
     返回按照给定属性绘制时, 字符串所占有的边界大小
     
     - parameter attrs: 要应用于字符串的文本属性的字典
     
     - returns: 按照给定属性绘制时, 字符串所占有的边界大小
     */
    public func rg_sizeWithAttributes(attrs: [String: AnyObject]?) -> CGSize {
        return (self as NSString).sizeWithAttributes(attrs)
    }
}

//  MARK:
extension String {
    /**
     返回 String 对应的 Boolean 值
     
     - returns: String 对应的 Boolean 值
     */
    public func rg_boolValue() -> Bool {
        return (self as NSString).boolValue
    }
    
    /**
     返回 String 对应的 Int 值
     
     - returns: String 对应的 Int 值
     */
    public func rg_intValue() -> Int {
        return (self as NSString).integerValue
    }
    
    public func rg_floatValue() -> Float {
        return (self as NSString).floatValue
    }
    
    /**
     返回 String 对应的 Double 值
     
     - returns: String 对应的 Double 值
     */
    public func rg_doubleValue() -> Double {
        return (self as NSString).doubleValue
    }
}

//  MARK: App Infos
extension String {
    /**
     获取应用版本号
     
     - returns: String of app version
     */
    static func rg_stringOfAppVersion() -> String {
        let infoPath = NSBundle.mainBundle().pathForResource("Info", ofType: "plist")
        let infoDic = NSDictionary(contentsOfFile: infoPath!)
        let version = infoDic!["CFBundleShortVersionString"] as! String
        let build = infoDic!["CFBundleVersion"] as! String
        return version + " " + "(" + build + ")"
    }
    
    /**
     获取设备时间
     
     - returns: String of device time
     */
    static func rg_stringOfDeviceTime() -> String {
        let deviceTime = NSDate()
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd-HH-mm-ss"
        return dateFormatter.stringFromDate(deviceTime)
    }
}

//  MARK: Main Bundle
extension String {
    /**
     获取 Main Bundle 路径
     
     - returns: 表示 Main Bundle 路径的字符串
     */
    static func rg_pathOfMainBundle() -> String {
        return NSBundle.mainBundle().description
    }
    
    /**
     获取 Main Bundle 中的文件路径
     
     - parameter name: 文件名
     - parameter ext:  文件后缀名
     
     - returns: Main Bundle 中文件的路径
     */
    static func rg_pathForResourceInMainBundle(name: String?, ofType ext: String?) -> String? {
        return NSBundle.mainBundle().pathForResource(name, ofType: ext)
    }
    
    /**
     获取 Main Bundle 中文件内的字符串
     
     - parameter name: 文件名
     - parameter ext:  文件后缀名
     
     - returns: Main Bundle 中文件内的字符串
     */
    public init?(pathForResource name: String?, ofType ext: String?) {
        guard let path = NSBundle.mainBundle().pathForResource(name, ofType: ext) else {
            print("RGBring :: String init with path for resource of type error: path is nil")
            return nil
        }
        try? self.init(contentsOfFile: path)
    }
}

//  MARK: Sandbox
extension String {
    /**
     获取 Home Directory 文件夹的路径
     
     - returns: Home Directory 文件夹的路径
     */
    static func rg_pathOfHomeDirectory() -> String {
        return NSHomeDirectory()
    }
    
    /**
     获取 Documents 文件夹的路径
     
     - returns: Documents 文件夹的路径
     */
    static func rg_pathOfDocuments() -> String? {
        return NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first?.path
    }
    
    /**
     获取 Caches 文件夹的路径
     
     - returns: Caches 文件夹的路径
     */
    static func rg_pathOfCaches() -> String? {
        return NSFileManager.defaultManager().URLsForDirectory(.CachesDirectory, inDomains: .UserDomainMask).first?.path
    }
    
    /**
     获取 tmp 文件夹的路径
     
     - returns: tmp文件夹的路径
     */
    static func rg_pathOfTmp() -> String {
        return NSTemporaryDirectory()
    }
}
