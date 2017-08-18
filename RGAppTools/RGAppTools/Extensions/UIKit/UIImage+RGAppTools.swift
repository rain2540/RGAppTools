//
//  UIImage+RGAppTools.swift
//  RGAppTools
//
//  Created by RAIN on 2017/6/19.
//  Copyright © 2017年 Smartech. All rights reserved.
//

import UIKit

extension RGAppTools where Base: UIImage {
    public var data: Data? {
        guard let jpegData = UIImageJPEGRepresentation(base, 1.0) else {
            guard let pngData = UIImagePNGRepresentation(base) else { return nil }
            return pngData
        }
        return jpegData
    }
}
