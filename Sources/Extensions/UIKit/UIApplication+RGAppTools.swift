//
//  UIApplication+RGAppTools.swift
//  RGAppTools
//
//  Created by RAIN on 2020/1/21.
//  Copyright © 2020 Smartech. All rights reserved.
//

import UIKit

extension RGAppTools where Base: UIApplication {

    public static var keyWindow: UIWindow? {
        if #available(iOS 13, *) {
            var keyWindow: UIWindow?
            for connectedScene in UIApplication.shared.connectedScenes {
                guard let windowScene = connectedScene as? UIWindowScene else {
                    continue
                }
                if #available(iOS 15, *) {
                    keyWindow = windowScene.keyWindow
                    break
                } else {
                    for window in windowScene.windows where window.isKeyWindow {
                        keyWindow = window
                    }
                }
            }
            return keyWindow
        } else {
            return UIApplication.shared.keyWindow
        }
    }

    /// frame of status bar
    public static var statusBarFrame: CGRect {
        if #available(iOS 13.0, *) {
            return UIApplication.shared.keyWindow?.windowScene?.statusBarManager?.statusBarFrame ?? UIApplication.shared.statusBarFrame
        } else {
            return UIApplication.shared.statusBarFrame
        }
    }

    /// height of status bar
    public static var statusBarHeight: CGFloat {
        return UIApplication.rat.statusBarFrame.height
    }

    /// default height of status bar
    public static var statusBarDefaultHeight: CGFloat {
        return UIDevice.rat.isIPhoneXSeriesUI ? 44.0 : 20.0
    }

}
