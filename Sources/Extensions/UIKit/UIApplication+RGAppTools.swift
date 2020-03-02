//
//  UIApplication+RGAppTools.swift
//  RGAppTools
//
//  Created by RAIN on 2020/1/21.
//  Copyright © 2020 Smartech. All rights reserved.
//

import UIKit

extension RGAppTools where Base: UIApplication {
    
    /// frame of status bar
    public static var statusBarFrame: CGRect {
        if #available(iOS 13.0, *) {
            return UIApplication.shared.keyWindow?.windowScene?.statusBarManager?.statusBarFrame ?? UIApplication.shared.statusBarFrame
        } else {
            return UIApplication.shared.statusBarFrame
        }
    }

    public static var statusBarHeight: CGFloat {
        return UIApplication.rat.statusBarFrame.height
    }

    public static var statusBarDefaultHeight: CGFloat {
        return UIDevice.rat.isIPhoneXSeriesUI ? 44.0 : 20.0
    }

}
