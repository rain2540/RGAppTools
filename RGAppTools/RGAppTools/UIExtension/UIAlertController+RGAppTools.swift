//
//  UIAlertController+RGAppTools.swift
//  RGAppTools
//
//  Created by RAIN on 2017/3/27.
//  Copyright © 2017年 Smartech. All rights reserved.
//

import UIKit

extension RGAppTools where Base: UIAlertController {
    
    public static func alert(title: String,
                             message: String,
                             in viewController: UIViewController,
                             actions: UIAlertAction...)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for action in actions {
            alert.addAction(action)
        }
        viewController.present(alert, animated: true, completion: nil)
    }
}
