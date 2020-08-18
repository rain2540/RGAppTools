//
//  TimeZone+RGAppTools.swift
//  RGAppTools
//
//  Created by RAIN on 2020/8/18.
//  Copyright © 2020 Smartech. All rights reserved.
//

import Foundation

extension TimeZone {

    public var rat: TimeZoneExtension {
        return TimeZoneExtension(timeZone: self)
    }

    public static var rat: TimeZoneExtension.Type {
        return TimeZoneExtension.self
    }

}


public struct TimeZoneExtension {

    private var timeZone: TimeZone

    fileprivate init(timeZone: TimeZone) {
        self.timeZone = timeZone
    }

}
