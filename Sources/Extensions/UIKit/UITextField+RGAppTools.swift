//
//  UITextField+RGAppTools.swift
//  RGAppTools
//
//  Created by RAIN on 2019/2/22.
//  Copyright © 2019 Smartech. All rights reserved.
//

import UIKit

extension RGAppTools where Base: UITextField {
    
    /// 默认高度
    public static var defaultHeight: CGFloat {
        return 30.0
    }
    
    /// 为 TextField 添加左侧图片
    ///
    /// - Parameters:
    ///   - name: 图片名
    ///   - frame: 图片的 frame
    ///   - contentMode: 图片的 content mode
    ///   - showMode: 图片的显示模式
    public func addLeftImage(named name: String,
                             frame: CGRect = CGRect(x: 0.0, y: 0.0, width: 20.0, height: 20.0),
                             contentMode: UIView.ContentMode = .center,
                             showMode: UITextField.ViewMode = .always)
    {
        let imageView = createImageView(imageNamed: name,
                                        frame: frame,
                                        contentMode: contentMode)
        base.leftViewMode = showMode
        base.leftView = imageView
    }
    
    /// 为 TextField 添加右侧图片
    ///
    /// - Parameters:
    ///   - name: 图片名
    ///   - frame: 图片的 frame
    ///   - contentMode: 图片的 content mode
    ///   - showMode: 图片的显示模式
    public func addRightImage(named name: String,
                              frame: CGRect = CGRect(x: 0.0, y: 0.0, width: 20.0, height: 20.0),
                              contentMode: UIView.ContentMode = .center,
                              showMode: UITextField.ViewMode = .always)
    {
        let imageView = createImageView(imageNamed: name,
                                        frame: frame,
                                        contentMode: contentMode)
        base.rightViewMode = showMode
        base.rightView = imageView
    }
    

    // MARK: - Private
    private func createImageView(imageNamed name: String,
                                 frame: CGRect,
                                 contentMode: UIView.ContentMode) -> UIImageView
    {
        let imageView = UIImageView()
        imageView.image = UIImage(named: name)
        imageView.frame = frame
        imageView.contentMode = contentMode
        return imageView
    }
}
