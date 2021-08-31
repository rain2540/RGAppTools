//
//  RGAppTools.swift
//  RGAppTools
//
//  Created by RAIN on 2016/12/5.
//  Copyright © 2016-2017 Smartech. All rights reserved.
//

import Foundation

public struct RGAppTools<Base> {

    public let base: Base

    public init(_ base: Base) {
        self.base = base
    }

}


// MARK: -

public protocol RGAppToolsCompatible {

    associatedtype RATCompatibleType

    var rat: RATCompatibleType { get }
    static var rat: RATCompatibleType.Type { get }

}


extension RGAppToolsCompatible {

    public var rat: RGAppTools<Self> {
        return RGAppTools(self)
    }

    public static var rat: RGAppTools<Self>.Type {
        return RGAppTools.self
    }

}


// MARK: -

extension NSObject: RGAppToolsCompatible { }
