//
//  DispatchQueue+RGAppTools.swift
//  RGAppTools
//
//  Created by RAIN on 2016/11/12.
//  Copyright © 2016-2017 Smartech. All rights reserved.
//

import Foundation

extension RGAppTools where Base: DispatchQueue {

    /// 代码延迟执行
    /// - Parameters:
    ///   - delay: 延迟时间 (单位: 秒)
    ///   - closure: 延迟执行的代码块
    public func after(_ delay: TimeInterval, execute closure: @escaping () -> Void) {
        base.asyncAfter(deadline: .now() + delay, execute: closure)
    }

    /// 只执行一次与唯一 Token 相关的代码块。代码是线程安全的, 即使在存在多线程调用的情况下, 也只会执行一次代码。
    /// - Parameters:
    ///   - token: 唯一 token 的名称, 采用反向 DNS 风格, 如: com.apple
    ///   - task: 只执行一次的代码块
    public static func once(token: String, task: () -> Void) {
        objc_sync_enter(Base.self)

        defer {
            objc_sync_exit(Base.self)
        }

        if Base.onceToken.contains(token) {
            return
        }
        Base.onceToken.append(token)

        task()
    }

}

public extension DispatchQueue {
    fileprivate static var onceToken: [String] = []
}
