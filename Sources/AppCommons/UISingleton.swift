//
//  UISingleton.swift
//  RGAppTools
//
//  Created by RAIN on 2020/1/21.
//  Copyright © 2020 Smartech. All rights reserved.
//

import UIKit

/// Application
public let SharedApplication = UIApplication.shared

/// AppDelegate
public let SharedAppDelegate = UIApplication.shared.delegate

/// Main Window
public let AppMainWindow = UIApplication.shared.delegate?.window

/// Root View Controller
public let RootViewController = UIApplication.shared.delegate?.window??.rootViewController

/// Key Window
public let AppKeyWindow = UIApplication.shared.keyWindow

/// Main Screen
public let AppMainScreen = UIScreen.main
