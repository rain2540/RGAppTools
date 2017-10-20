//
//  UIConstant.swift
//  RGAppTools
//
//  Created by RAIN on 2017/8/16.
//  Copyright © 2017年 Smartech. All rights reserved.
//

import UIKit

public var is_iPhoneX: Bool {
    return (UIScreen.main.bounds.height == 812.0 && UIScreen.main.bounds.width == 375.0)
}

/// Status Bar 默认高度
public let StatusBarDefaultHeight: CGFloat = is_iPhoneX ? 44.0 : 20.0

/// Navigation Bar 默认高度
public let NavigationBarDefaultHeight: CGFloat = 44.0

/// Top Layout 默认高度
public var TopLayoutDefaultHeight: CGFloat {
    return StatusBarDefaultHeight + NavigationBarDefaultHeight
}

/// Tab Bar 默认高度
public let TabBarDefaultHeight: CGFloat = 49.0

/// Tool Bar 默认高度
public let ToolBarDefaultHeight: CGFloat = 44.0

/// 视图默认间距
public let ViewDefaultInterval: CGFloat = 8.0

/// Label 默认高度
public let LabelDefaultHeight: CGFloat = 21.0

/// Button 默认高度
public let ButtonDefaultHeight: CGFloat = 44.0

/// TextField 默认高度
public let TextFieldDefaultHeight: CGFloat = 30.0

/// TableViewCell 默认高度
public let TableViewCellDefaultHeight: CGFloat = 44.0

/// Home Indicator 所在区域高度
public let HomeIndicatorAreaHeight: CGFloat = 34.0
