//
//  AppSingleton.swift
//  RGAppTools
//
//  Created by RAIN on 16/2/2.
//  Copyright © 2016年 Smartech. All rights reserved.
//

import UIKit

/// Application
public let kSharedApplication = UIApplication.shared

/// AppDelegate
internal let kAppDelegate = UIApplication.shared.delegate as? AppDelegate

/// Main Window
public let kAppMainWindow = (UIApplication.shared.delegate as? AppDelegate)?.window

/// Root View Controller
public let kRootViewController = (UIApplication.shared.delegate as? AppDelegate)?.window?.rootViewController

/// Main Screen
public let kMainScreen = UIScreen.main

/// Standard UserDefaults
public let kStandardUserDefaults = UserDefaults.standard

/// Default Notification Center
public let kDefaultNotificationCenter = NotificationCenter.default

/// Default File Manager
public let kDefaultFileManager = FileManager.default

/// Main Bundle
public let MainBundle = Bundle.main
