//
//  UIImage+RGAppTools.swift
//  RGAppTools
//
//  Created by RAIN on 2017/6/19.
//  Copyright © 2017年 Smartech. All rights reserved.
//

import UIKit

extension RGAppTools where Base: UIImage {
    /// Image 对应的 data
    public var data: Data? {
        guard let jpegData = UIImageJPEGRepresentation(base, 1.0) else {
            guard let pngData = UIImagePNGRepresentation(base) else { return nil }
            return pngData
        }
        return jpegData
    }

    /// Image 对应的 Base64 String
    public var base64String: String? {
        guard let data = self.data else { return nil }
        return data.base64EncodedString()
    }

     /// 创建矩形图像
     ///
     /// - Parameters:
     ///   - size: 尺寸
     ///   - backColor: 背景色(默认`white`)
     ///   - lineColor: 边线颜色(默认`lightGray`)
     ///   - lineWidth: 变现宽度(默认`1.0`)
     /// - Returns: 新创建的图像
     public func createRectImage(size: CGSize?,
                                backColor: UIColor = .white,
                                lineColor: UIColor = .lightGray,
                                lineWidth: CGFloat = 1.0) -> UIImage?
    {
        var size = size
        if size == nil {
            size = base.size
        }

        // 依据新图片的大小创建绘制区域
        let rect = CGRect(origin: .zero, size: size!)

        // 1.图像的上下文 - 内存中开辟一个地址, 跟屏幕无关
        /**
         * 1> size:   绘图的尺寸
         * 2> opaque: 不透明:false(透明) / true(不透明)
         * 3> scale:  屏幕分辨率,默认情况下生成的图像使用'1.0'的分辨率,图像质量不好
         *            可以指定'0',会选择当前设备的屏幕分辨率
         */
        UIGraphicsBeginImageContextWithOptions(rect.size, true, 0.0)

        // 2.背景填充(在裁切之前做填充)
        backColor.setFill()
        UIRectFill(rect)

        // 3.绘图'drawInRect'就是在指定区域内重绘图片
        base.draw(in: rect)

        // 4.绘制边线
        // 按照新尺寸的图片边界实例化一个路径
        let path = UIBezierPath(rect: rect)
        lineColor.setStroke()
        path.lineWidth = lineWidth
        path.stroke()

        // 4.取得结果
        let result = UIGraphicsGetImageFromCurrentImageContext()

        // 5.关闭上下文
        UIGraphicsEndImageContext()
        
        // 6.返回结果
        return result
    }
}
