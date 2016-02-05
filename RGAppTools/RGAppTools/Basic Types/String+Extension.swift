//
//  String+Extension.swift
//  RGAppTools
//
//  Created by RAIN on 16/2/2.
//  Copyright © 2016年 Smartech. All rights reserved.
//

import Foundation

//  MARK: Clear nil
extension String {
    /**
     清除 nil 和 NSNull 对象，并返回字符串
     
     - parameter obj: 未经处理的对象(NSObject)
     
     - returns: 经处理后的字符串
     */
    static func rg_stringWithoutNull(obj: NSObject?) -> String {
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

//  MARK: File Path - Main Bundle
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
