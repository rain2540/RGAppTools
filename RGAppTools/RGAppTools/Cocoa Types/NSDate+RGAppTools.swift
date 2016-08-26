//
//  NSDate+RGAppTools.swift
//  RGAppTools
//
//  Created by RAIN on 16/5/7.
//  Copyright © 2016年 Smartech. All rights reserved.
//

import Foundation

//  MARK: Transform
extension NSDate {
    /**
     返回某个时间对应的时间戳

     - returns: 某个时间对应的时间戳
     */
    public func rg_toTimestamp() -> NSTimeInterval {
        return self.timeIntervalSince1970
    }


//    public func rg_timestampString() -> String {
//        return String(self.rg_toTimestamp())
//    }
//
//    public class func rg_timestampForNow() -> NSTimeInterval {
//        return NSDate().timeIntervalSince1970
//    }
//
//    public class func rg_timestampForNowString() -> String {
//        return String(NSDate.rg_timestampForNow())
//    }
}
