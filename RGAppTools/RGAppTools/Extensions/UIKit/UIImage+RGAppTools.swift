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

    /// 将图片转换到新的尺寸, 并返回新尺寸图片对象
    ///
    /// - Parameter newSize: 图片的新尺寸
    /// - Returns: 新尺寸图片对象
    public func trans(to newSize: CGSize) -> UIImage? {
        UIGraphicsBeginImageContext(newSize)
        base.draw(in: CGRect(x: 0.0, y: 0.0, width: newSize.width, height: newSize.height))
        guard let newImage = UIGraphicsGetImageFromCurrentImageContext() else {
            UIGraphicsEndImageContext()
            return nil
        }
        UIGraphicsEndImageContext()
        return newImage
    }
}
