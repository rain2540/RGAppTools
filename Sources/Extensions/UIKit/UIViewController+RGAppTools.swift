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

    /// 获取当前屏幕显示的 view controller
    public static var topViewControllerOfKeyWindowRoot: UIViewController? {
        guard let rootVC = UIApplication.shared.keyWindow?.rootViewController else { return nil }
        let topVC = topViewController(of: rootVC)
        return topVC
    }

    /// 获取 root view controller 的最上层视图
    /// - Parameter rootViewController: 需要获取 top view controller 的根视图
    /// - Returns: 获取到的 最上层视图
    public static func topViewController(of rootViewController: UIViewController) -> UIViewController? {
        var rootVC = rootViewController
        var topVC: UIViewController? = nil

        if rootVC.presentedViewController != nil {
            // 根视图是被 present 出来的
            rootVC = rootVC.presentedViewController!
        }

        if rootVC is UITabBarController {
            // 根视图为 UITabBarController
            let tabBarController = rootVC as! UITabBarController
            topVC = topViewController(of: tabBarController.selectedViewController!)
        } else if rootVC is UINavigationController {
            // 根视图为 UINavigationController
            let navigationController = rootVC as! UINavigationController
            topVC = topViewController(of: navigationController.visibleViewController!)
        } else {
            // 根视图非导航类
            topVC = rootVC
        }

        return topVC
    }

}
