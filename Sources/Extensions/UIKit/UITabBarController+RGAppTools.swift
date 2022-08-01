//
//  UITabBarController+RGAppTools.swift
//  RGAppTools
//
//  Created by RAIN on 2021/3/10.
//  Copyright © 2021 Smartech. All rights reserved.
//

import UIKit

extension RGAppTools where Base: UITabBarController {

  public func buildTabBarItem(
    title: String,
    titleSize: CGFloat = 12.0,
    titleFontName: String,
    selectedImageName: String,
    selectedTitleColor: UIColor,
    normalImageName: String,
    normalTitleColor: UIColor) -> UITabBarItem
  {
    let titleFont = UIFont(name: titleFontName, size: titleSize) ?? UIFont.systemFont(ofSize: titleSize)
    // 未选中字体颜色
    let normalAttributes = [
      NSAttributedString.Key.foregroundColor: normalTitleColor,
      NSAttributedString.Key.font: titleFont
    ]
    UITabBarItem.appearance().setTitleTextAttributes(normalAttributes, for: .normal)

    // 选中字体颜色
    let selectedAttributes = [
      NSAttributedString.Key.foregroundColor: selectedTitleColor,
      NSAttributedString.Key.font: titleFont
    ]
    UITabBarItem.appearance().setTitleTextAttributes(selectedAttributes, for: .selected)

    let mode = UIImage.RenderingMode.alwaysOriginal
    return UITabBarItem(
      title: title,
      image: UIImage(named: normalImageName)?.withRenderingMode(mode),
      selectedImage: UIImage(named: selectedImageName)?.withRenderingMode(mode))
  }

}
