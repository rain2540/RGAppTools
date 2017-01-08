//
//  UIDevice+RGAppTools.swift
//  RGAppTools
//
//  Created by RAIN on 16/2/2.
//  Copyright © 2016年 Smartech. All rights reserved.
//

import UIKit

/// Enum of Device Types
enum DeviceType {
    case unknown,
    //  iPhone
    iPhone_2G,
    iPhone_3G,
    iPhone_3GS,
    iPhone_4,
    iPhone_4S,
    iPhone_5,
    iPhone_5c,
    iPhone_5s,
    iPhone_6_Plus,
    iPhone_6,
    iPhone_6s,
    iPhone_6s_Plus,
    iPhone_SE,
    iPhone_7,
    iPhone_7_Plus,
    //  iPod Touch
    iPod_Touch_1,
    iPod_Touch_2,
    iPod_Touch_3,
    iPod_Touch_4,
    iPod_Touch_5,
    iPod_Touch_6,
    //  iPad
    iPad_1,
    iPad_2,
    iPad_3,
    iPad_4,
    iPad_Mini,
    iPad_Air,
    iPad_Mini_2,
    iPad_Air_2,
    iPad_Mini_3,
    iPad_Mini_4,
    iPad_Pro,
    //  Apple TV
    Apple_TV,
    //  Simulator
    simulator_32bit,
    simulator_64bit
}

extension RGAppTools where Base: UIDevice {
    static var deviceType: DeviceType {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        switch identifier {
        case "iPod5,1":
            print("iPod Touch 5")
            return .iPod_Touch_5

        case "iPod7,1":
            print("iPod Touch 6")
            return .iPod_Touch_6

        case "iPhone3,1", "iPhone3,2", "iPhone3,3":
            print("iPhone 4")
            return .iPhone_4

        case "iPhone4,1":
            print("iPhone 4S")
            return .iPhone_4S

        case "iPhone5,1", "iPhone5,2":
            print("iPhone 5")
            return .iPhone_5

        case "iPhone5,3", "iPhone5,4":
            print("iPhone 5c")
            return .iPhone_5c

        case "iPhone6,1", "iPhone6,2":
            print("iPhone 5s")
            return .iPhone_5s

        case "iPhone7,2":
            print("iPhone 6")
            return .iPhone_6

        case "iPhone7,1":
            print("iPhone 6 Plus")
            return .iPhone_6_Plus

        case "iPhone8,1":
            print("iPhone 6s")
            return .iPhone_6s

        case "iPhone8,2":
            print("iPhone 6s Plus")
            return .iPhone_6s_Plus

        case "iPhone8,4":
            print("iPhone SE")
            return .iPhone_SE

        case "iPhone9,1":
            print("iPhone 7")
            return .iPhone_7

        case "iPhone9,2":
            print("iPhone 7 Plus")
            return .iPhone_7_Plus

        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":
            print("iPad 2")
            return .iPad_2

        case "iPad3,1", "iPad3,2", "iPad3,3":
            print("iPad 3")
            return .iPad_3

        case "iPad3,4", "iPad3,5", "iPad3,6":
            print("iPad 4")
            return .iPad_4

        case "iPad4,1", "iPad4,2", "iPad4,3":
            print("iPad Air")
            return .iPad_Air

        case "iPad5,3", "iPad5,4":
            print("iPad Air 2")
            return .iPad_Air_2

        case "iPad2,5", "iPad2,6", "iPad2,7":
            print("iPad Mini")
            return .iPad_Mini

        case "iPad4,4", "iPad4,5", "iPad4,6":
            print("iPad Mini 2")
            return .iPad_Mini_2

        case "iPad4,7", "iPad4,8", "iPad4,9":
            print("iPad Mini 3")
            return .iPad_Mini_3

        case "iPad5,1", "iPad5,2":
            print("iPad Mini 4")
            return .iPad_Mini_4

        case "iPad6,7", "iPad6,8":
            print("iPad Pro")
            return .iPad_Pro

        case "AppleTV5,3":
            print("Apple TV")
            return .Apple_TV

        case "i386":
            print("Simulator 32 bit")
            return .simulator_32bit

        case "x86_64":
            print("Simulator 64 bit")
            return .simulator_64bit

        default:
            print("unknown")
            return .unknown
        }
    }
}

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
        print("device.localizedModel: ", device.localizedModel)
        
        print("device.systemName: ", device.systemName)
        print("device.systemVersion: ", device.systemVersion)
        
        print("device.identifierForVendor: ", device.identifierForVendor ?? "\nRGAppTools get device.identifierForVendor failed.")
    }
}
