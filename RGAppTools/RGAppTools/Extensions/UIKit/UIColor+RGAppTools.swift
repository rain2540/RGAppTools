//
//  UIColor+RGAppTools.swift
//  RGAppTools
//
//  Created by RAIN on 2017/6/19.
//  Copyright © 2017年 Smartech. All rights reserved.
//

import UIKit

extension RGAppTools where Base: UIColor {
    public static func color(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> Base {
        return Base(red: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: alpha)
    }

    public static func color(hexString: String, alpha: CGFloat) -> Base {
        var red: CGFloat = 0.0, green: CGFloat = 0.0, blue:  CGFloat = 0.0
        var cString = hexString.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines).uppercased()

        guard cString.hasPrefix("0X") || cString.hasPrefix("#") else {
            print("Invalid RGB hex string, missing '#' or '0x' as prefix.")
            return Base(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
        }

        if cString.hasPrefix("0X") {
            cString = cString.substring(from: cString.index(cString.startIndex, offsetBy: 2))
        } else if cString.hasPrefix("#") {
            cString = cString.substring(from: cString.index(cString.startIndex, offsetBy: 1))
        }

        let scanner = Scanner(string: cString)
        var hexValue: CUnsignedLongLong = 0
        guard scanner.scanHexInt64(&hexValue) else {
            print("Scan hex error.")
            return Base(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0)
        }

        switch (cString.characters.count) {
        case 3:
            red   = CGFloat((hexValue & 0xF00) >> 8)       / 15.0
            green = CGFloat((hexValue & 0x0F0) >> 4)       / 15.0
            blue  = CGFloat(hexValue & 0x00F)              / 15.0

        case 6:
            red   = CGFloat((hexValue & 0xFF0000) >> 16)   / 255.0
            green = CGFloat((hexValue & 0x00FF00) >> 8)    / 255.0
            blue  = CGFloat(hexValue & 0x0000FF)           / 255.0

        default:
            red = 0.0; green = 0.0; blue = 1.0
            NSLog("Invalid RGB hex string, number of characters after '#' or '0x' should be either 3 or 6.")
        }
        return Base(red: red, green: green, blue: blue, alpha: alpha)
    }
}
