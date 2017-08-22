//
//  UIView+RGAppTools.swift
//  RGAppTools
//
//  Created by RAIN on 2017/8/16.
//  Copyright © 2017年 Smartech. All rights reserved.
//

import UIKit

enum RGLineDirection {
    case horizontal
    case vertical
}

extension RGAppTools where Base: UIView {

    var size: CGSize { return base.bounds.size }

    var minX: CGFloat { return base.frame.minX }
    var midX: CGFloat { return base.frame.midX }
    var maxX: CGFloat { return base.frame.maxX }

    var minY: CGFloat { return base.frame.minY }
    var midY: CGFloat { return base.frame.midY }
    var maxY: CGFloat { return base.frame.maxY }
}

extension UIView {
    var rat_width: CGFloat {
        get {
            return self.frame.size.width
        }
        set {
            var frame = self.frame
            frame.size.width = newValue
            self.frame = frame
        }
    }

    var rat_height: CGFloat {
        get {
            return self.frame.size.height
        }
        set {
            var frame = self.frame
            frame.size.height = newValue
            self.frame = frame
        }
    }

    var rat_x: CGFloat {
        get {
            return self.frame.origin.x
        }
        set {
            var frame = self.frame
            frame.origin.x = newValue
            self.frame = frame
        }
    }

    var rat_y: CGFloat {
        get {
            return self.frame.origin.y
        }
        set {
            var frame = self.frame
            frame.origin.y = newValue
            self.frame = frame
        }
    }
}
