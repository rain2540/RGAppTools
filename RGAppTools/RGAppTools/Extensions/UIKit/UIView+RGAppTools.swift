//
//  UIView+RGAppTools.swift
//  RGAppTools
//
//  Created by RAIN on 2017/8/16.
//  Copyright © 2017年 Smartech. All rights reserved.
//

import UIKit

public enum RGLineDirection {
    case horizontal
    case vertical
}

extension RGAppTools where Base: UIView {
    // MARK: Draw
    /// 在 view 的指定位置加指定长宽、颜色的线
    ///
    /// - Parameters:
    ///   - startPoint: 起始点坐标
    ///   - length: 长度
    ///   - width: 宽度
    ///   - color: 颜色
    ///   - direction: 方向
    /// - Returns: 按参数条件添加的线
    public func drawLine(
        from startPoint: CGPoint,
        length: CGFloat,
        width: CGFloat,
        color: UIColor,
        direction: RGLineDirection = .horizontal) -> UIView
    {
        let line = UIView()
        switch direction {
        case .horizontal:
            line.frame = CGRect(x: startPoint.x, y: startPoint.y, width: length, height: width)

        case .vertical:
            line.frame = CGRect(x: startPoint.x, y: startPoint.y, width: width, height: length)
        }
        line.backgroundColor = color
        base.addSubview(line)
        return line
    }

    /// 为视图添加边线
    ///
    /// - Parameters:
    ///   - width: 边线宽度
    ///   - cornerRadius: 边线圆角半径, 若无圆角则该值为0
    ///   - color: 边线颜色
    public func addBorder(width: CGFloat, cornerRadius: CGFloat, color: UIColor) {
        base.layer.masksToBounds = true
        base.layer.borderWidth = width
        base.layer.cornerRadius = cornerRadius
        base.layer.borderColor = color.cgColor
    }

    // MARK: Interaction
    /// 设置视图交互状态
    ///
    /// - Parameter status: 表示交互状态的布尔值
    public func interaction(status: Bool) {
        base.isUserInteractionEnabled = status
        base.isMultipleTouchEnabled = status
    }

    // MARK: Rect
    /// 视图尺寸
    var size: CGSize { return base.bounds.size }

    /// 视图横坐标最小值
    var minX: CGFloat { return base.frame.minX }
    /// 视图中心横坐标值
    var midX: CGFloat { return base.frame.midX }
    /// 视图横坐标最大值
    var maxX: CGFloat { return base.frame.maxX }

    /// 视图纵坐标最小值
    var minY: CGFloat { return base.frame.minY }
    /// 视图中心纵坐标值
    var midY: CGFloat { return base.frame.midY }
    /// 视图纵坐标最大值
    var maxY: CGFloat { return base.frame.maxY }
}

public class UIViewFrameExtension {
    private var view: UIView

    fileprivate init(_ view: UIView) {
        self.view = view
    }

    /// 视图左上角横坐标值
    public var x: CGFloat {
        get {
            return view.rat_x
        }
        set {
            view.rat_x = newValue
        }
    }

    /// 视图左上角纵坐标值
    public var y: CGFloat {
        get {
            return view.rat_y
        }
        set {
            view.rat_y = newValue
        }
    }

    /// 视图宽度
    public var width: CGFloat {
        get {
            return view.rat_width
        }
        set {
            view.rat_width = newValue
        }
    }
}

extension UIView {
    public var rat: UIViewFrameExtension {
        return UIViewFrameExtension(self)
    }

    fileprivate var rat_x: CGFloat {
        get {
            return self.frame.origin.x
        }
        set {
            var frame = self.frame
            frame.origin.x = newValue
            self.frame = frame
        }
    }

    fileprivate var rat_y: CGFloat {
        get {
            return self.frame.origin.y
        }
        set {
            var frame = self.frame
            frame.origin.y = newValue
            self.frame = frame
        }
    }

    fileprivate var rat_width: CGFloat {
        get {
            return self.frame.size.width
        }
        set {
            var frame = self.frame
            frame.size.width = newValue
            self.frame = frame
        }
    }

    /// 视图高度
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

    var rat_size: CGSize {
        get {
            return self.frame.size
        }
        set {
            var frame = self.frame
            frame.size = newValue
            self.frame = frame
        }
    }

    /// 视图中心横坐标
    var rat_centerX: CGFloat {
        get {
            return self.center.x
        }
        set {
            var center = self.center
            center.x = newValue
            self.center = center
        }
    }

    var rat_centerY: CGFloat {
        get {
            return self.center.y
        }
        set {
            var center = self.center
            center.y = newValue
            self.center = center
        }
    }

    // TODO: /// 视图上边界


    // TODO: /// 视图下边界
    
    
    // TODO: /// 视图左边界
    
    
    // TODO: /// 视图右边界
}
