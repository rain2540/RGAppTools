//
//  UIAlertController+RGAppTools.swift
//  RGAppTools
//
//  Created by RAIN on 2017/3/27.
//  Copyright © 2017年 Smartech. All rights reserved.
//

import UIKit

extension RGAppTools where Base: UIAlertController {
    
    /// 在视图中显示 Alert
    /// - Parameters:
    ///   - viewController: 展示 Alert 的视图
    ///   - title: Alert 标题
    ///   - message: Alert 内容
    ///   - actions: 完成的 actions
    public static func showAlert(in viewController: UIViewController,
                                 title: String,
                                 message: String,
                                 actions: UIAlertAction...)
    {
        let alertView = alert(title: title, message: message, actions: actions)
        viewController.present(alertView, animated: true, completion: nil)
    }
    
    /// create an alert
    /// - Parameters:
    ///   - title: alert title
    ///   - message: alert message
    ///   - actions: alert button actions
    public static func alert(title: String,
                             message: String,
                             actions: UIAlertAction...) -> UIAlertController
    {
        let alertView = alert(title: title, message: message, actions: actions)
        return alertView
    }
    
    /// 在视图中显示 ActionSheet
    /// - Parameters:
    ///   - viewController: 展示 ActionSheet 的视图
    ///   - title: ActionSheet 标题
    ///   - message: ActionSheet 内容
    ///   - actions: 完成的 actions
    public static func showActionSheet(in viewController: UIViewController,
                                       title: String,
                                       message: String,
                                       actions: UIAlertAction...)
    {
        let sheet = actionSheet(title: title, message: message, actions: actions)
        viewController.present(sheet, animated: true, completion: nil)
    }
    
    public static func actionSheeet(title: String,
                                    message: String,
                                    actions: UIAlertAction...) -> UIAlertController
    {
        let sheet = actionSheet(title: title, message: message, actions: actions)
        return sheet
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
    
    private static func actionSheet(title: String,
                                   message: String,
                                   actions: [UIAlertAction]) -> UIAlertController
    {
        let actionSheet = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        for action in actions {
            actionSheet.addAction(action)
        }
        return actionSheet
    }
    
}
