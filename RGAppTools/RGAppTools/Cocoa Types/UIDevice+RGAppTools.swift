//
//  UIDevice+RGAppTools.swift
//  RGAppTools
//
//  Created by RAIN on 16/2/2.
//  Copyright © 2016年 Smartech. All rights reserved.
//

import UIKit

//  MARK: Device informations
extension UIDevice {
    /**
     打印当前设备信息
     */
    public static func rg_deviceInformations() {
        print("currentDevice: ", UIDevice.current)
        
        let device = UIDevice()
        print("device.name: ", device.name)
        print("device.model: ", device.model)
        NSLog("device.localizedModel: %@", device.localizedModel)
        
        NSLog("device.systemName: %@", device.systemName)
        NSLog("device.systemVersion: %@", device.systemVersion)
        
        print("device.identifierForVendor: ", device.identifierForVendor)
    }
}
