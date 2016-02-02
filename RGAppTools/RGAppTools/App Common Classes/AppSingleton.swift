//
//  AppSingleton.swift
//  RGAppTools
//
//  Created by RAIN on 16/2/2.
//  Copyright © 2016年 Smartech. All rights reserved.
//

import UIKit

public let kApplication = UIApplication.sharedApplication()

internal let kAppDelegate = UIApplication.sharedApplication().delegate as? AppDelegate

public let kAppMainWindow = (UIApplication.sharedApplication().delegate as? AppDelegate)?.window

public let kRootViewController = (UIApplication.sharedApplication().delegate as? AppDelegate)?.window?.rootViewController

public let kMainScreen = UIScreen.mainScreen()
