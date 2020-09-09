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

    public static var topViewControllerOfKeyWindowRoot: UIViewController? {
        guard let rootVC = UIApplication.shared.keyWindow?.rootViewController else { return nil }
        let topVC = topViewController(of: rootVC)
        return topVC
    }

    public static func topViewController(of rootViewController: UIViewController) -> UIViewController? {
        var rootVC = rootViewController
        var topVC: UIViewController? = nil

        if rootVC.presentedViewController != nil {
            rootVC = rootVC.presentedViewController!
        }

        if rootVC is UITabBarController {
            let tabBarController = rootVC as! UITabBarController
            topVC = topViewController(of: tabBarController.selectedViewController!)
        } else if rootVC is UINavigationController {
            let navigationController = rootVC as! UINavigationController
            topVC = topViewController(of: navigationController.visibleViewController!)
        } else {
            topVC = rootVC
        }

        return topVC
    }

}
