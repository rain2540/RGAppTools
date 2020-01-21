//
//  UIApplication+RGAppTools.swift
//  RGAppTools
//
//  Created by RAIN on 2020/1/21.
//  Copyright © 2020 Smartech. All rights reserved.
//

import UIKit

extension RGAppTools where Base: UIApplication {

    public static var statusBarFrame: CGRect {
        if #available(iOS 13.0, *) {
            return UIApplication.shared.keyWindow?.windowScene?.statusBarManager?.statusBarFrame ?? UIApplication.shared.statusBarFrame
        } else {
            return UIApplication.shared.statusBarFrame
        }
    }

}
