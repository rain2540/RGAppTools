//
//  MainScreen.swift
//  RGAppTools
//
//  Created by RAIN on 2017/4/5.
//  Copyright © 2017年 Smartech. All rights reserved.
//

import UIKit

public struct MainScreen {

    public static var pixelWidth: CGFloat { return width * scale }
    public static var pixelHeight: CGFloat { return height * scale }

    /// scale of main screen
    public static var scale: CGFloat { return self.mainScreen.scale }
    /// width of main screen
    public static var width: CGFloat { return self.size.width }
    /// height of main screen
    public static var height: CGFloat { return self.size.height }
    /// size of main screen
    public static var size: CGSize { return self.bounds.size }
    /// bounds of main screen
    public static var bounds: CGRect { return self.mainScreen.bounds }


    // MARK: - Private
    private static let mainScreen = UIScreen.main

}
