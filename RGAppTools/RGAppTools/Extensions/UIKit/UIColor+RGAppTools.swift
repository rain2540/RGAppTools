//
//  UIColor+RGAppTools.swift
//  RGAppTools
//
//  Created by RAIN on 2017/6/19.
//  Copyright © 2017年 Smartech. All rights reserved.
//

import UIKit

extension RGAppTools where Base: UIColor {
    static func color(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> Base {
        return Base(red: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: alpha)
    }
}
