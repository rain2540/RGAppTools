//
//  MethodInfo.swift
//  RGAppTools
//
//  Created by RAIN on 16/2/2.
//  Copyright © 2016年 Smartech. All rights reserved.
//

import Foundation

struct MethodInfo {
    /**
     在控制台输出方法信息
     
     - parameter message: 原样显示在控制台的信息
     - parameter file:    文件名
     - parameter method:  方法名
     - parameter line:    代码行数
     */
    func methodLog<T>(message: T,
        file: String = #file,
        method: String = #function,
        line: Int = #line)
    {
        print("\((file as NSString).lastPathComponent)[\(line)], \(method): \(message)")
    }
}
