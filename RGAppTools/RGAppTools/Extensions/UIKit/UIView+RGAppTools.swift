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


    // MARK: - Interaction
    /// 设置视图交互状态
    ///
    /// - Parameter status: 表示交互状态的布尔值
    public func interaction(status: Bool) {
        base.isUserInteractionEnabled = status
        base.isMultipleTouchEnabled = status
    }


    // MARK: - Rect
    /// 视图横坐标最小值
    public var minX: CGFloat { return base.frame.minX }
    /// 视图中心横坐标值
    public var midX: CGFloat { return base.frame.midX }
    /// 视图横坐标最大值
    public var maxX: CGFloat { return base.frame.maxX }
    
    /// 视图纵坐标最小值
    public var minY: CGFloat { return base.frame.minY }
    /// 视图中心纵坐标值
    public var midY: CGFloat { return base.frame.midY }
    /// 视图纵坐标最大值
    public var maxY: CGFloat { return base.frame.maxY }
}


// MARK: -
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
    
    /// 视图高度
    public var height: CGFloat {
        get {
            return view.rat_height
        }
        set {
            view.rat_height =  newValue
        }
    }
    
    /// 视图大小
    public var size: CGSize {
        get {
            return view.rat_size
        }
        set {
            view.rat_size = newValue
        }
    }
    
    /// 视图中心横坐标
    public var centerX: CGFloat {
        get {
            return view.rat_centerX
        }
        set {
            view.rat_centerX = newValue
        }
    }
    
    /// 视图中心纵坐标
    public var centerY: CGFloat {
        get {
            return view.rat_centerY
        }
        set {
            view.rat_centerY = newValue
        }
    }
    
    /// 视图上边界
    public var top: CGFloat {
        get {
            return view.rat_top
        }
        set {
            view.rat_top = newValue
        }
    }

    /// 视图下边界
    public var bottom: CGFloat {
        get {
            return view.rat_bottom
        }
        set {
            view.rat_bottom = newValue
        }
    }

    /// 视图左边界
    public var left: CGFloat {
        get {
            return view.rat_left
        }
        set {
            view.rat_left = newValue
        }
    }

    /// 视图右边界
    public var right: CGFloat {
        get {
            return view.rat_right
        }
        set {
            view.rat_right = newValue
        }
    }
}


// MARK: -
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
    
    fileprivate var rat_height: CGFloat {
        get {
            return self.frame.size.height
        }
        set {
            var frame = self.frame
            frame.size.height = newValue
            self.frame = frame
        }
    }
    
    fileprivate var rat_size: CGSize {
        get {
            return self.frame.size
        }
        set {
            var frame = self.frame
            frame.size = newValue
            self.frame = frame
        }
    }
    
    fileprivate var rat_centerX: CGFloat {
        get {
            return self.center.x
        }
        set {
            var center = self.center
            center.x = newValue
            self.center = center
        }
    }
    
    fileprivate var rat_centerY: CGFloat {
        get {
            return self.center.y
        }
        set {
            var center = self.center
            center.y = newValue
            self.center = center
        }
    }
    
    fileprivate var rat_top: CGFloat {
        get {
            return self.rat_y
        }
        set {
            self.rat_y = newValue
        }
    }

    fileprivate var rat_bottom: CGFloat {
        get {
            return self.rat_y + self.rat_height
        }
        set {
            self.rat_y = newValue - self.rat_height
        }
    }

    fileprivate var rat_left: CGFloat {
        get {
            return self.rat_x
        }
        set {
            self.rat_x = newValue
        }
    }
    
    fileprivate var rat_right: CGFloat {
        get {
            return self.rat_x + self.rat_width
        }
        set {
            self.rat_x = newValue - self.rat_width
        }
    }
}
