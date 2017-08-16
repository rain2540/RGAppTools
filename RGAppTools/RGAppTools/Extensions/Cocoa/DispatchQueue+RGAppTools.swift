//
//  DispatchQueue+RGAppTools.swift
//  RGAppTools
//
//  Created by RAIN on 2016/11/12.
//  Copyright © 2016年 Smartech. All rights reserved.
//

import Foundation

extension RGAppTools where Base: DispatchQueue {
    public func after(_ delay: TimeInterval, execute closure: @escaping () -> Void) {
        base.asyncAfter(deadline: .now() + delay, execute: closure)
    }

    public func once(token: String, task: () -> ()) {
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
