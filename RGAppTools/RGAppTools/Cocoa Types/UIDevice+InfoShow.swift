//
//  UIDevice+InfoShow.swift
//  RGAppTools
//
//  Created by RAIN on 16/2/2.
//  Copyright © 2016年 Smartech. All rights reserved.
//

import UIKit

extension UIDevice {
    /**
     打印当前设备信息
     */
    static func rg_deviceInformations() {
        NSLog("currentDevice: %@", UIDevice.currentDevice())
        
        let device = UIDevice()
        NSLog("device.name: %@", device.name)
        NSLog("device.model:%@", device.model)
        NSLog("device.localizedModel: %@", device.localizedModel)
        
        NSLog("device.systemName: %@", device.systemName)
        NSLog("device.systemVersion: %@", device.systemVersion)
        
        NSLog("device.identifierForVendor: %@", device.identifierForVendor!)
    }
}
