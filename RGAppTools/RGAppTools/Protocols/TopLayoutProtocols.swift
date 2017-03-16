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

extension TopView {
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
        
        return view
    }

}
