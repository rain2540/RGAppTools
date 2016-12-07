//
//  RGAppTools.swift
//  RGAppTools
//
//  Created by RAIN on 2016/12/5.
//  Copyright © 2016年 Smartech. All rights reserved.
//

import Foundation

public struct RGAppTools<Base> {
    public let base: Base

    public init(_ base: Base) {
        self.base = base
    }
}

protocol RGAppToolsCompatible {
    
}
