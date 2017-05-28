//
//  MainScreen.swift
//  RGAppTools
//
//  Created by RAIN on 2017/4/5.
//  Copyright © 2017年 Smartech. All rights reserved.
//

import UIKit

struct MainScreen {
    public static var width: CGFloat { return self.size.width }
    public static var height: CGFloat { return self.size.height }
    public static var size: CGSize { return self.bounds.size }
    public static var bounds: CGRect { return self.mainScreen.bounds }
    static private let mainScreen = UIScreen.main
}
