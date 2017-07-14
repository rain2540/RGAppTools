//
//  Bundle+RGAppTools.swift
//  RGAppTools
//
//  Created by RAIN on 2017/6/12.
//  Copyright © 2017年 Smartech. All rights reserved.
//

import Foundation

extension RGAppTools where Base: Bundle {
    /// Main Bundle 路径
    public static var mainBundlePath: String {
        return Bundle.main.bundlePath
    }

    /// 应用版本号
    public static var appVersion: String {
        let infoPath = Bundle.main.path(forResource: "Info", ofType: "plist")
        let infoDic = NSDictionary(contentsOfFile: infoPath!)
        let version = infoDic!["CFBundleShortVersionString"] as! String
        let build = infoDic!["CFBundleVersion"] as! String
        return version + " " + "(" + build + ")"
    }

    /// 应用的 Bundle Identifier
    public static var identifier: String {
        let infoPath = Bundle.main.path(forResource: "Info", ofType: "plist")
        let infoDic = NSDictionary(contentsOfFile: infoPath!)
        return infoDic!["CFBundleIdentifier"] as! String
    }
    
    public static func path(forResourceInMainBundle name: String?,
                            ofType ext: String?) -> String?
    {
        return Bundle.main.path(forResource: name, ofType: ext)
    }
}
