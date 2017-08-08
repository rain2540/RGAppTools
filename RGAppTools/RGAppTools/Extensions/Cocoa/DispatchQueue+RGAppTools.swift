//
//  DispatchQueue+RGAppTools.swift
//  RGAppTools
//
//  Created by RAIN on 2016/11/12.
//  Copyright © 2016年 Smartech. All rights reserved.
//

import Foundation

extension RGAppTools where Base: DispatchQueue {
    func after(_ delay: TimeInterval, execute closure: @escaping () -> Void) {
        base.asyncAfter(deadline: .now() + delay, execute: closure)
    }
}

public extension DispatchQueue {
    fileprivate static var onceToken: [String] = []
}
