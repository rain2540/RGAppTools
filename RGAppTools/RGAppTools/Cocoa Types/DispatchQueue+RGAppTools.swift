//
//  DispatchQueue+RGAppTools.swift
//  RGAppTools
//
//  Created by RAIN on 2016/11/12.
//  Copyright © 2016年 Smartech. All rights reserved.
//

import Foundation

public extension DispatchQueue {
    private static var onceToken: [String] = []

    public func once(token: String, task: () -> ()) {

    }
}
