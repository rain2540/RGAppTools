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
    /// 某个时间对应的时间戳
    public var rat_timestamp: TimeInterval {
        return self.timeIntervalSince1970
    }

    /// 描述某个时间对应的时间戳的字符串
    public var rat_timestampString: String {
        return String(self.rat_timestamp)
    }

    /// 当前时间对应的时间戳
    public static var rat_timestampforNow: TimeInterval {
        return Date().timeIntervalSince1970
    }

    /// 描述实时对应的时间戳的字符串
    public static var rat_timestampForNowString: String {
        return String(Date.rat_timestampforNow)
    }
}

extension Date {
    /// 某时间点对应的 year 值
    public var rat_year: Int {
        return self.rat_components(unit: .year)
    }

    /// 某时间点对应的 month 值
    public var rat_month: Int {
        return self.rat_components(unit: .month)
    }

    /// 某时间点对应的 day 值
    public var rat_day: Int {
        return self.rat_components(unit: .day)
    }

    /// 某时间点对应的 hour 值
    public var rat_hour: Int {
        return self.rat_components(unit: .hour)
    }

    /// 某时间点对应的 minute 值
    public var rat_minute: Int {
        return self.rat_components(unit: .minute)
    }

    /// 某时间点对应的 second 值
    public var rat_second: Int {
        return self.rat_components(unit: .second)
    }
    
    /// 依据参数, 给出某时间点对应的时间组件的值
    ///
    /// - Parameter unit: 需要的时间组件
    /// - Returns: 时间组件的值
    public func rat_components(unit: Calendar.Component) -> Int {
        let cal = Calendar.current
        return cal.component(unit, from: self)
    }
}
