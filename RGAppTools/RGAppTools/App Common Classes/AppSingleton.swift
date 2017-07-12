//
//  AppSingleton.swift
//  RGAppTools
//
//  Created by RAIN on 16/2/2.
//  Copyright © 2016年 Smartech. All rights reserved.
//

import UIKit

/// Application
public let SharedApplication = UIApplication.shared

/// AppDelegate
internal let SharedAppDelegate = UIApplication.shared.delegate as? AppDelegate

/// Main Window
public let AppMainWindow = (UIApplication.shared.delegate as? AppDelegate)?.window

/// Root View Controller
public let RootViewController = (UIApplication.shared.delegate as? AppDelegate)?.window?.rootViewController

/// Main Screen
public let AppMainScreen = UIScreen.main

/// Standard UserDefaults
public let StandardUserDefaults = UserDefaults.standard

/// Default Notification Center
public let DefaultNotificationCenter = NotificationCenter.default

/// Default File Manager
public let DefaultFileManager = FileManager.default

/// Main Bundle
public let MainBundle = Bundle.main
