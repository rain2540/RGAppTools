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
    public func rat_toTimestamp() -> TimeInterval {
        return self.timeIntervalSince1970
    }

    /**
     返回描述某个时间对应的时间戳的字符串

     - returns: 描述某个时间对应的时间戳的字符串
     */
    public func rat_timestampString() -> String {
        return String(self.rat_toTimestamp())
    }

    /**
     返回实时对应的时间戳

     - returns: 实时对应的时间戳
     */
    public static func rat_timestampForNow() -> TimeInterval {
        return NSDate().timeIntervalSince1970
    }

    /**
     返回描述实时对应的时间戳的字符串

     - returns: 描述实时对应的时间戳的字符串
     */
    public static func rat_timestampForNowString() -> String {
        return String(Date.rat_timestampForNow())
    }
}

extension Date {
    public var rat_year: Int {
        return self.rat_components(unit: .year)
    }

    public var rat_month: Int {
        return self.rat_components(unit: .month)
    }

    public var rat_day: Int {
        return self.rat_components(unit: .day)
    }

    public var rat_hour: Int {
        return self.rat_components(unit: .hour)
    }
    
    public func rat_components(unit: Calendar.Component) -> Int {
        let cal = Calendar.current
        return cal.component(unit, from: self)
    }
}
