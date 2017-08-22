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
        view.frame = CGRect(x: 0.0, y: 0.0, width: MainScreen.width, height: 64.0)
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
        view.frame = CGRect(x: 0.0, y: 0.0, width: MainScreen.width, height: 20.0)
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

    var naviView: UIView {
        let view = UIView()
        view.frame = CGRect(x: 0.0, y: 20.0, width: MainScreen.width, height: 44.0)
        view.backgroundColor = naviColor
        view.isUserInteractionEnabled = true
        return view
    }

    func buildTopView() {
        view.addSubview(topView)
        view.addSubview(statusView)
        view.addSubview(naviView)
    }
}

// MARK: 
protocol TopViewWithTitle: TopView {
    var titleString: String { get set }
    var titleFont: UIFont { get set }
    var titleColor: UIColor { get set }
}

extension TopViewWithTitle where Self: UIViewController {
    var titleString: String {
        get {
            return ""
        }
        set {
            titleString = newValue
        }
    }

    var titleFont: UIFont {
        get {
            return UIFont.systemFont(ofSize: 12.0)
        }
        set {
            titleFont = newValue
        }
    }

    var titleColor: UIColor {
        get {
            return UIColor.black
        }
        set {
            titleColor = newValue
        }
    }

    var titleLabel: UILabel {
        let titleSize = titleString.rat_sizeWithFont(titleFont)
        let label = UILabel()
        label.font = titleFont
        label.textColor = titleColor
        label.text = titleString
        label.frame = CGRect(x: (naviView.bounds.width - titleSize.width) / 2.0,
                             y: statusView.bounds.height + (naviView.bounds.height - titleSize.height) / 2,
                             width: titleSize.width,
                             height: titleSize.height)
        return label
    }

    func addTitle() {
        self.view.addSubview(titleLabel)
    }
}
