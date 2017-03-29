//
//  TopLayoutProtocols.swift
//  RGAppTools
//
//  Created by RAIN on 2016/11/23.
//  Copyright © 2016年 Smartech. All rights reserved.
//

import UIKit

protocol TopView {
    var topColor: UIColor { get set }
    var statusColor: UIColor { get set }
    var naviColor: UIColor { get set }
}

extension TopView where Self: UIViewController {
    var topColor: UIColor {
        get {
            return UIColor.clear
        }
        set {
            topColor = newValue
        }
    }

    var topView: UIView {
        let view = UIView()
        view.frame = CGRect(x: 0.0, y: 0.0, width: self.view.bounds.width, height: 64.0)
        view.backgroundColor = topColor
        return view
    }

    var statusColor: UIColor {
        get {
            return UIColor.clear
        }

        set {
            statusColor = newValue
        }
    }

    var statusView: UIView {
        let view = UIView()
        view.frame = CGRect(x: 0.0, y: 0.0, width: self.view.bounds.width, height: 20.0)
        view.backgroundColor = statusColor
        return view
    }
    
    var naviColor: UIColor {
        get {
            return UIColor.clear
        }
        set {
            naviColor = newValue
        }
    }
}
