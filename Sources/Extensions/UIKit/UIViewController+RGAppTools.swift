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
    public var topViewController: UIViewController? {
        UIViewController.rat.topViewController(of: base)
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
