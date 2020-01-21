//
//  Bundle+RGAppTools.swift
//  RGAppTools
//
//  Created by RAIN on 2017/6/12.
//  Copyright © 2017年 Smartech. All rights reserved.
//

import Foundation

/// 应用版本号 Build 字段格式
///
/// - normal: 括号 形如: 1.0.0 (29)
/// - dot: 点  形如: 1.0.0.29
public enum BuildVersionFormat {
    /// 应用版本号 Build 字段格式 - 括号 (默认值) 形如: 1.0.0 (29)
    case normal
    /// 应用版本号 Build 字段格式 - 点 形如: 1.0.0.29
    case dot
}

extension RGAppTools where Base: Bundle {
    /// Main Bundle 路径
    public static var mainBundlePath: String {
        return Bundle.main.bundlePath
    }
    
    /// 应用版本号
    public static var appVersion: String {
        return appVersion(format: .normal)
    }
    
    /// 应用显示名称
    public static var displayName: String {
        let infoPath = Bundle.main.path(forResource: "Info", ofType: "plist")
        let infoDic = NSDictionary(contentsOfFile: infoPath!)
        return infoDic!["CFBundleDisplayName"] as! String
    }
    
    /// 应用的 Bundle Identifier
    public static var identifier: String {
        let infoPath = Bundle.main.path(forResource: "Info", ofType: "plist")
        let infoDic = NSDictionary(contentsOfFile: infoPath!)
        return infoDic!["CFBundleIdentifier"] as! String
    }
    
    /// 应用版本号
    ///
    /// - Parameter format: 输出的格式
    /// - Returns: 表示应用版本号的字符串
    public static func appVersion(format: BuildVersionFormat) -> String {
        guard let infoPath = Bundle.main.path(forResource: "Info", ofType: "plist"),
            let infoDic = NSDictionary(contentsOfFile: infoPath),
            let version = infoDic["CFBundleShortVersionString"],
            let build = infoDic["CFBundleVersion"] else {
                return ""
        }
        return format == .normal ? "\(version) (\(build))" : "\(version).\(build)"
    }
    
    /// 获取 Main Bundle 中的文件路径
    ///
    /// - Parameters:
    ///   - name: 文件名
    ///   - ext: 文件后缀名
    /// - Returns: Main Bundle 中文件的路径
    public static func path(forResourceInMainBundle name: String?,
                            ofType ext: String?) -> String?
    {
        return Bundle.main.path(forResource: name, ofType: ext)
    }
    
    /// 获取 Main Bundle 中文件内的字符串
    ///
    /// - Parameters:
    ///   - name: 文件名
    ///   - ext: 文件后缀名
    /// - Returns: Main Bundle 中文件内的字符串
    public static func string(pathForResourceInMainBundle name: String?,
                              ofType ext: String?) -> String?
    {
        guard let path = Bundle.main.path(forResource: name, ofType: ext) else {
            print("RGAppTools String init with path for resource in main bundle error: \n", "path is nil")
            return nil
        }
        do {
            return try String(contentsOfFile: path)
        } catch let error as NSError {
            print("RGAppTools String init with path for resource in main bundle error: \n", error)
            return nil
        }
    }
}