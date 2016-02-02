//
//  Double+Extension.swift
//  RGAppTools
//
//  Created by RAIN on 16/2/2.
//  Copyright © 2016年 Smartech. All rights reserved.
//

import Foundation

extension Double {
    /**
     角度转化为弧度
     
     - returns: 转化完成的弧度值
     */
    public func degreeToRadian() -> Double {
        return (M_PI * self) / 180.0
    }
    
    /**
     弧度转化为角度
     
     - returns: 转化完成的角度值
     */
    public func radianToDegree() -> Double {
        return (180.0 * self) / M_PI
    }
}

extension Double {
    /**
     格式化输出
     
     - parameter fmt: 以字符串形式表示的输出格式
     
     - returns: 格式化输出结果
     */
    public func format(fmt: String) -> String {
        return String(format: "%\(fmt)f", self)
    }
}
