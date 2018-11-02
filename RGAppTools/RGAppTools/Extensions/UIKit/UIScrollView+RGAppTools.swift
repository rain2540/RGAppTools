//
//  UIScrollView+RGAppTools.swift
//  RGAppTools
//
//  Created by RAIN on 2018/10/31.
//  Copyright © 2018年 Smartech. All rights reserved.
//

import UIKit

extension RGAppTools where Base: UIScrollView {
    /// 注册 Table View / Collection View 的 Cell
    ///
    /// - Parameter cellClass: Cell 类
    public func registerNibCell(with cellClass: AnyClass) {
        if let nibName = anyClassToString(cellClass) {
            let cellNib = UINib(nibName: nibName, bundle: nil)

            if let tableView = base as? UITableView {
                tableView.register(cellNib, forCellReuseIdentifier: nibName)
            } else if let collectionView = base as? UICollectionView {
                collectionView.register(cellNib, forCellWithReuseIdentifier: nibName)
            }
        }
    }

    /// 注册 Table View 的 Header / Footer
    ///
    /// - Parameter viewClass: Header / Footer 类
    public func registerNibHeaderFooter(with viewClass: AnyClass) {
        if let nibName = anyClassToString(viewClass) {
            let nib = UINib(nibName: nibName, bundle: nil)

            if let tableView = base as? UITableView {
                tableView.register(nib, forHeaderFooterViewReuseIdentifier: nibName)
            }
        }
    }
    
    /// 描述类名的字符串
    ///
    /// - Parameter className: 要转换成字符串的类
    /// - Returns: 转换后的字符串
    private func anyClassToString(_ className: AnyClass) -> String? {
        let desc = className.description()
        guard desc.contains(".") else {
            return desc
        }
        return desc.components(separatedBy: ".").last
    }
}
