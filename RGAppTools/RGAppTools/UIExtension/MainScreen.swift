//
//  MainScreen.swift
//  RGAppTools
//
//  Created by RAIN on 2017/4/5.
//  Copyright © 2017年 Smartech. All rights reserved.
//

import UIKit

struct MainScreen {

    /// width of main screen
    public static var width: CGFloat { return self.size.width }
    /// height of main screen
    public static var height: CGFloat { return self.size.height }
    /// size of main screen
    public static var size: CGSize { return self.bounds.size }
    /// bounds of main screen
    public static var bounds: CGRect { return self.mainScreen.bounds }
    static private let mainScreen = UIScreen.main
}
