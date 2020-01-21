//
//  UIViewController+RGAppTools.swift
//  RGAppTools
//
//  Created by RAIN on 2017/8/16.
//  Copyright © 2017年 Smartech. All rights reserved.
//

import UIKit

extension RGAppTools where Base: UIViewController {
    /// 获取位于最上层的视图
    public var topViewController: UIViewController {
        if base is UITabBarController {
            let tabBarController = base as! UITabBarController
            return tabBarController.selectedViewController!.rat.topViewController
        } else if base is UINavigationController {
            let navigationController = base as! UINavigationController
            return navigationController.visibleViewController!.rat.topViewController
        } else if let presentedViewController = base.presentedViewController {
            return presentedViewController.rat.topViewController
        } else {
            return base
        }
    }
}
