//
//  UITextField+RGAppTools.swift
//  RGAppTools
//
//  Created by RAIN on 2019/2/22.
//  Copyright © 2019 Smartech. All rights reserved.
//

import UIKit

extension RGAppTools where Base: UITextField {

    public func addRightImage(named name: String,
                              frame: CGRect = CGRect(x: 0.0, y: 0.0, width: 20.0, height: 20.0),
                              contentMode: UIView.ContentMode = .center,
                              showMode: UITextField.ViewMode = .always)
    {
        let imageView = UIImageView()
        imageView.image = UIImage(named: name)
        imageView.frame = frame
        imageView.contentMode = contentMode
        base.rightViewMode = showMode
        base.rightView = imageView
    }

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
