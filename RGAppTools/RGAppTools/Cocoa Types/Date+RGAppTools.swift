//
//  Date+RGAppTools.swift
//  RGAppTools
//
//  Created by RAIN on 16/5/7.
//  Copyright © 2016年 Smartech. All rights reserved.
//

import Foundation

//  MARK: Transform
extension Date {
    /**
     返回某个时间对应的时间戳

     - returns: 某个时间对应的时间戳
     */
    public func rg_toTimestamp() -> TimeInterval {
        return self.timeIntervalSince1970
    }

    /**
     返回描述某个时间对应的时间戳的字符串

     - returns: 描述某个时间对应的时间戳的字符串
     */
    public func rg_timestampString() -> String {
        return String(self.rg_toTimestamp())
    }

    /**
     返回实时对应的时间戳

     - returns: 实时对应的时间戳
     */
    public static func rg_timestampForNow() -> TimeInterval {
        return NSDate().timeIntervalSince1970
    }

    /**
     返回描述实时对应的时间戳的字符串

     - returns: 描述实时对应的时间戳的字符串
     */
    public static func rg_timestampForNowString() -> String {
        return String(Date.rg_timestampForNow())
    }
}
