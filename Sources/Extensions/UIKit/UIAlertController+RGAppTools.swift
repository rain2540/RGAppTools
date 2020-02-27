//
//  UIAlertController+RGAppTools.swift
//  RGAppTools
//
//  Created by RAIN on 2017/3/27.
//  Copyright © 2017年 Smartech. All rights reserved.
//

import UIKit

extension RGAppTools where Base: UIAlertController {
    
    /// 在视图中添加 Alert
    ///
    /// - Parameters:
    ///   - title: Alert 标题
    ///   - message: Alert 内容
    ///   - viewController: 展示 Alert 的视图
    ///   - actions: 完成的 actions
    public static func showAlert(in viewController: UIViewController,
                                 title: String,
                                 message: String,
                                 actions: UIAlertAction...)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for action in actions {
            alert.addAction(action)
        }
        viewController.present(alert, animated: true, completion: nil)
    }
    
    public static func alert(title: String,
                             message: String,
                             actions: UIAlertAction...) -> UIAlertController
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for action in actions {
            alert.addAction(action)
        }
        return alert
    }

    /// 在视图中添加 ActionSheet
    ///
    /// - Parameters:
    ///   - title: ActionSheet 标题
    ///   - message: ActionSheet 内容
    ///   - viewController: 展示 ActionSheet 的视图
    ///   - actions: 完成的 actions
    public static func actionSheet(title: String,
                                   message: String,
                                   in viewController: UIViewController,
                                   actions: UIAlertAction...)
    {
        let actionSheet = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        for action in actions {
            actionSheet.addAction(action)
        }
        viewController.present(actionSheet, animated: true, completion: nil)
    }
    
    
    // MARK: - Private
    private static func alert(title: String,
                             message: String,
                             actions: [UIAlertAction]) -> UIAlertController
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for action in actions {
            alert.addAction(action)
        }
        return alert
    }
}
