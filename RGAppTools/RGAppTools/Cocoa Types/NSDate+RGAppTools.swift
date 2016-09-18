//
//  NSDate+RGAppTools.swift
//  RGAppTools
//
//  Created by RAIN on 16/5/7.
//  Copyright © 2016年 Smartech. All rights reserved.
//

import Foundation

//  MARK: Transform
extension Date {
    /**
     时间转换为时间戳
     
     - returns: 转换得到的时间戳
     */
    public func rg_toTimestamp() -> String {
        return String(self.timeIntervalSince1970)
    }
}
