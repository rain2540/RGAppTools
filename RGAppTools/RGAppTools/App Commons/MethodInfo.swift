//
//  MethodInfo.swift
//  RGAppTools
//
//  Created by RAIN on 16/2/2.
//  Copyright © 2016-2017 Smartech. All rights reserved.
//

import Foundation

public struct MethodInfo {
    /// 在控制台输出方法信息
    ///
    /// - Parameters:
    ///   - message: 原样显示在控制台的信息
    ///   - file: 文件名
    ///   - method: 方法名
    ///   - line: 代码行数
    public static func methodLog<T>(_ message: T,
                                    file:   String = #file,
                                    method: String = #function,
                                    line:   Int    = #line)
    {
        print("\((file as NSString).lastPathComponent)[\(line)], \(method): \(message)")
    }
}
