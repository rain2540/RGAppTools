//
//  Date+RGAppTools.swift
//  RGAppTools
//
//  Created by RAIN on 16/5/7.
//  Copyright © 2016-2017 Smartech. All rights reserved.
//

import Foundation


extension Date {

    public var rat: DateExtension {
        return DateExtension(date: self)
    }

    public static var rat: DateExtension.Type {
        return DateExtension.self
    }

}


// MARK: -

public struct DateExtension {

    private var date: Date

    fileprivate init(date: Date) {
        self.date = date
    }

}


// MARK: - Timestamp

extension DateExtension {

    /// 某个时间对应的时间戳
    public var timestamp: TimeInterval {
        return date.timeIntervalSince1970
    }

    /// 描述某个时间对应的时间戳的字符串
    public var timestampString: String {
        return String(timestamp)
    }

    /// 当前时间对应的时间戳
    public static var timestampforNow: TimeInterval {
        return Date().timeIntervalSince1970
    }

    /// 描述实时对应的时间戳的字符串
    public static var timestampForNowString: String {
        return String(Date.rat.timestampforNow)
    }

}


// MARK: - Time Point

public extension DateExtension {

    var yesterday: Date {
        return Date(timeInterval: -24 * 60 * 60, since: date)
    }

}


//  MARK: - Transform

extension DateExtension {

    public func dateString(format: String = "yyyy-MM-dd",
                           timeZone: TimeZone? = TimeZone.rat.chinaMainLand) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = timeZone
        let dateString = dateFormatter.string(from: date)
        return dateString
    }

}


// MARK: - Judgement

extension DateExtension {

    public var isLeapYear: Bool {
        let res = Date.rat.isLeapYear(for: year)
        return res
    }

    public static func isLeapYear(for year: Int) -> Bool {
        let res = ((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0)
        return res
    }

}


// MARK: - Component

extension DateExtension {

    /// 某时间点对应的 year 值
    public var year: Int {
        return components(unit: .year)
    }

    /// 某时间点对应的 month 值
    public var month: Int {
        return components(unit: .month)
    }

    /// 某时间点对应的 day 值
    public var day: Int {
        return components(unit: .day)
    }

    /// 某时间点对应的 hour 值
    public var hour: Int {
        return components(unit: .hour)
    }

    /// 某时间点对应的 minute 值
    public var minute: Int {
        return components(unit: .minute)
    }

    /// 某时间点对应的 second 值
    public var second: Int {
        return components(unit: .second)
    }

    /// 依据参数, 给出某时间点对应的时间组件的值
    ///
    /// - Parameter unit: 需要的时间组件
    /// - Returns: 时间组件的值
    public func components(unit: Calendar.Component) -> Int {
        let cal = Calendar.current
        return cal.component(unit, from: date)
    }
}
