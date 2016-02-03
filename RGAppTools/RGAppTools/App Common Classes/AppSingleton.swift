//
//  AppSingleton.swift
//  RGAppTools
//
//  Created by RAIN on 16/2/2.
//  Copyright © 2016年 Smartech. All rights reserved.
//

import UIKit

/// Application
public let kApplication = UIApplication.sharedApplication()

/// AppDelegate
internal let kAppDelegate = UIApplication.sharedApplication().delegate as? AppDelegate

/// Main Window
public let kAppMainWindow = (UIApplication.sharedApplication().delegate as? AppDelegate)?.window

/// Root View Controller
public let kRootViewController = (UIApplication.sharedApplication().delegate as? AppDelegate)?.window?.rootViewController

/// Main Screen
public let kMainScreen = UIScreen.mainScreen()
