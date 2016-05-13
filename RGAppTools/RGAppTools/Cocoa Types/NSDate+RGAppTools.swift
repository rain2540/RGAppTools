//
//  NSDate+RGAppTools.swift
//  RGAppTools
//
//  Created by RAIN on 16/5/7.
//  Copyright © 2016年 Smartech. All rights reserved.
//

import Foundation

extension NSDate {
    public func rg_toTimestamp() -> String {
        return String(self.timeIntervalSince1970)
    }
}
