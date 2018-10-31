//
//  UIScrollView+RGAppTools.swift
//  RGAppTools
//
//  Created by RAIN on 2018/10/31.
//  Copyright © 2018年 Smartech. All rights reserved.
//

import UIKit

extension RGAppTools where Base: UIScrollView {
    private func anyClassToString(_ className: AnyClass) -> String? {
        let desc = className.description()
        guard desc.contains(".") else {
            return desc
        }
        return desc.components(separatedBy: ".").last
    }
}
