//
//  UITabBar+RGAppTools.swift
//  RGAppTools
//
//  Created by RAIN on 2017/8/16.
//  Copyright © 2017年 Smartech. All rights reserved.
//

import UIKit

extension RGAppTools where Base: UITabBar {

  /// 默认高度
  public static var defaultHeight: CGFloat {
    return 49.0
  }

  /// 修改 Tab Bar 的背景颜色
  /// - Parameter color: 提供给 Tab Bar 的背景的 tint color
  public static func barTintColor(_ color: UIColor) {
    UITabBar.appearance().barTintColor = color
  }

  /// 修改 Tab Bar item 的 tint color
  /// - Parameter color: 提供给 Tab Bar item 的 tint color
  public static func tintColor(_ color: UIColor) {
    UITabBar.appearance().tintColor = color
  }

}
