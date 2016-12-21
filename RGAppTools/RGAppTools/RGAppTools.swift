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

public protocol RGAppToolsCompatible {
    associatedtype RATCompatibleType
    var rat: RATCompatibleType { get }
    static var rat: RATCompatibleType.Type { get }
}

public extension RGAppToolsCompatible {
    public var rat: RGAppTools<Self> {
        return RGAppTools(self)
    }

    public static var rat: RGAppTools<Self>.Type {
        return RGAppTools.self
    }
}

extension NSObject: RGAppToolsCompatible { }
