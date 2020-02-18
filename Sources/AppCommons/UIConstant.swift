//
//  UIConstant.swift
//  RGAppTools
//
//  Created by RAIN on 2017/8/16.
//  Copyright © 2017年 Smartech. All rights reserved.
//

import UIKit

// MARK: Constants
/// Tool Bar 默认高度
public let ToolBarDefaultHeight: CGFloat = 44.0


// MARK: - Deprecated
@available(*, deprecated, message: "Extensions directly on is_iPhoneX in UIConstant is deprecated. Use `UIDevice.rat.isIPhoneXSeries` instead.", renamed: "UIDevice.rat.isIPhoneXSeries")
public var is_iPhoneX: Bool {
    return (UIScreen.main.bounds.height == 812.0 && UIScreen.main.bounds.width == 375.0)
}

/// 视图默认间距
@available(*, deprecated, message: "Constant 'ViewDefaultInterval' is deprecated. Use`UIView.rat.defaultInterval` instead.", renamed: "UIView.rat.defaultInterval")
public let ViewDefaultInterval: CGFloat = 8.0

/// Status Bar 的 Frame
@available(*, deprecated, message: "Constant 'StatusBarFrame' is deprecated. Use`UIApplication.rat.statusBarFrame` instead.", renamed: "UIApplication.rat.statusBarFrame")
public let StatusBarFrame = UIApplication.shared.statusBarFrame

/// Status Bar 的 Height
@available(*, deprecated, message: "Constant 'StatusBarHeight' is deprecated. Use`UIApplication.rat.statusBarHeight` instead.", renamed: "UIApplication.rat.statusBarHeight")
public let StatusBarHeight = StatusBarFrame.height

/// Status Bar 默认高度
@available(*, deprecated, message: "Constant 'StatusBarDefaultHeight' is deprecated. Use`UIApplication.rat.statusBarDefaultHeight` instead.", renamed: "UIApplication.rat.statusBarDefaultHeight")
public let StatusBarDefaultHeight: CGFloat = is_iPhoneX ? 44.0 : 20.0

/// Navigation Bar 默认高度
@available(*, deprecated, message: "Constant 'NavigationBarDefaultHeight' is deprecated. Use`UINavigationBar.rat.defaultHeight` instead.", renamed: "UINavigationBar.rat.defaultHeight")
public let NavigationBarDefaultHeight: CGFloat = 44.0

/// Top Layout 的 高度
@available(*, deprecated, message: "Constant 'TopLayoutHeight' is deprecated. Use`UIView.rat.topLayoutHeight` instead.", renamed: "UIView.rat.topLayoutHeight")
public var TopLayoutHeight: CGFloat {
    return StatusBarHeight + NavigationBarDefaultHeight
}

/// Top Layout 默认高度
@available(*, deprecated, message: "Constant 'TopLayoutDefaultHeight' is deprecated. Use`UIView.rat.topLayoutDefaultHeight` instead.", renamed: "UIView.rat.topLayoutDefaultHeight")
public var TopLayoutDefaultHeight: CGFloat {
    return StatusBarDefaultHeight + NavigationBarDefaultHeight
}

/// Label 默认高度
@available(*, deprecated, message: "Constant 'LabelDefaultHeight' is deprecated. Use`UILabel.rat.defaultHeight` instead.", renamed: "UILabel.rat.defaultHeight")
public let LabelDefaultHeight: CGFloat = 21.0

/// Button 默认高度
@available(*, deprecated, message: "Constant 'ButtonDefaultHeight' is deprecated. Use`UIButton.rat.defaultHeight` instead.", renamed: "UIButton.rat.defaultHeight")
public let ButtonDefaultHeight: CGFloat = 44.0

/// TableViewCell 默认高度
@available(*, deprecated, message: "Constant 'TableViewCellDefaultHeight' is deprecated. Use`UITableViewCell.rat.defaultHeight` instead.", renamed: "UITableViewCell.rat.defaultHeight")
public let TableViewCellDefaultHeight: CGFloat = 44.0

/// TextField 默认高度
@available(*, deprecated, message: "Constant 'TextFieldDefaultHeight' is deprecated. Use`UITextField.rat.defaultHeight` instead.", renamed: "UITextField.rat.defaultHeight")
public let TextFieldDefaultHeight: CGFloat = 30.0

/// Tab Bar 默认高度
@available(*, deprecated, message: "Constant 'TabBarDefaultHeight' is deprecated. Use`UITabBar.rat.defaultHeight` instead.", renamed: "UITabBar.rat.defaultHeight")
public let TabBarDefaultHeight: CGFloat = 49.0

/// Home Indicator 所在区域高度
@available(*, deprecated, message: "Constant 'HomeIndicatorAreaHeight' is deprecated. Use`UIView.rat.homeIndicatorAreaHeight` instead.", renamed: "UIView.rat.homeIndicatorAreaHeight")
public let HomeIndicatorAreaHeight: CGFloat = 34.0
