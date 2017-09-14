//
//  UINavigationBar+RGAppTools.swift
//  RGAppTools
//
//  Created by RAIN on 2017/8/16.
//  Copyright © 2017年 Smartech. All rights reserved.
//

import UIKit

extension RGAppTools where Base: UINavigationBar {
    /// 修改 Navigation Bar 的背景颜色
    ///
    /// - Parameter color: 提供给 Navigation Bar 的背景的 tint color
    public static func barTintColor(_ color: UIColor) {
        UINavigationBar.appearance().barTintColor = color
    }

    /// 修改 Navigation item 的 tint color
    ///
    /// - Parameter color: 提供给 Navigation item 的 tint color
    public static func tintColor(_ color: UIColor) {
        UINavigationBar.appearance().tintColor = color
    }

    /// 修改 Navigation Bar 的文字颜色
    ///
    /// - Parameter color: 提供给 Navigation Bar 上文字的颜色
    public static func titleTextColor(_ color: UIColor) {
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: color]
    }
}
