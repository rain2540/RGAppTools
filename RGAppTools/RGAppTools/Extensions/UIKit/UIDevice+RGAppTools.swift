//
//  UIDevice+RGAppTools.swift
//  RGAppTools
//
//  Created by RAIN on 16/2/2.
//  Copyright © 2016-2017 Smartech. All rights reserved.
//

import UIKit

extension RGAppTools where Base: UIDevice {

    /// 获取设备时间
    public var deviceTime: String {
        let deviceTime = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd HH:mm:ss"
        return dateFormatter.string(from: deviceTime)
    }
    
    /// 判断是否为 iPhone X 系列
    public static var isIPhoneXSeries: Bool {
        var iPhoneXSeries = false
        if UIDevice.rat.isPhoneOrPodUI == false {
            return iPhoneXSeries
        }
        
        if #available(iOS 11.0, *)  {
            if let bottom = UIApplication.shared.delegate?.window??.safeAreaInsets.bottom {
                if bottom > CGFloat(0.0) {
                    iPhoneXSeries = true
                }
            }
        }
        
        return iPhoneXSeries
    }

    /// 判断设备 UI 类型是否为 iPhone / iPod
    public static var isPhoneOrPodUI: Bool {
        return UIDevice.current.userInterfaceIdiom == .phone
    }
    
    /// 判断设备是否为 iPad
    public static var isPad: Bool {
        return UIDevice.current.userInterfaceIdiom == .pad
    }

    /// 打印当前设备信息
    public static func printDeviceInformations() {
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


/// Enum of Device Types
public enum DeviceType: String {
    case unknown    =   "unknown",

    //  iPhone
    iPhone_2G           =   "iPhone",
    iPhone_3G           =   "iPhone 3G",
    iPhone_3GS          =   "iPhone 3GS",
    iPhone_4            =   "iPhone 4",
    iPhone_4S           =   "iPhone 4S",
    iPhone_5            =   "iPhone 5",
    iPhone_5c           =   "iPhone 5c",
    iPhone_5s           =   "iPhone 5s",
    iPhone_6_Plus       =   "iPhone 6 Plus",
    iPhone_6            =   "iPhone 6",
    iPhone_6s           =   "iPhone 6s",
    iPhone_6s_Plus      =   "iPhone 6s Plus",
    iPhone_SE           =   "iPhone SE",
    iPhone_7            =   "iPhone 7",
    iPhone_7_Plus       =   "iPhone 7 Plus",
    iPhone_8            =   "iPhone 8",
    iPhone_8_Plus       =   "iPhone 8 Plus",
    iPhone_X            =   "iPhone X",
    iPhone_XS           =   "iPhone XS",
    iPhone_XS_Max       =   "iPhone XS Max",
    iPhone_XR           =   "iPhone XR",
    iPhone_11           =   "iPhone 11",
    iPhone_11_Pro       =   "iPhone 11 Pro",
    iPhone_11_Pro_Max   =   "iPhone 11 Pro Max",

    //  iPod Touch
    iPod_Touch_1    =   "iPod Touch 1",
    iPod_Touch_2    =   "iPod Touch 2",
    iPod_Touch_3    =   "iPod Touch 3",
    iPod_Touch_4    =   "iPod Touch 4",
    iPod_Touch_5    =   "iPod Touch 5",
    iPod_Touch_6    =   "iPod Touch 6",
    iPod_Touch_7    =   "iPod Touch 7",

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
    iPad_Pro_97,
    iPad_Pro_129,

    //  Apple TV
    Apple_TV,

    //  Simulator
    simulator_32bit,
    simulator_64bit
}


extension RGAppTools where Base: UIDevice {

    /// 获取设备类型
    public static var deviceType: DeviceType {

        switch deviceIdentifier {
        case "iPod1,1":
            print("iPod Touch 1G")
            return .iPod_Touch_1

        case "iPod2,1":
            print("iPod Touch 2G")
            return .iPod_Touch_2

        case "iPod3,1":
            print("iPod Touch 3G")
            return .iPod_Touch_3

        case "iPod4,1":
            print("iPod Touch 4G")
            return .iPod_Touch_4

        case "iPod5,1":
            print("iPod Touch (5 Gen)")
            return .iPod_Touch_5

        case "iPhone1,1":
            print("iPhone")
            return .iPhone_2G

        case "iPhone1,2":
            print("iPhone 3G")
            return .iPhone_3G

        case "iPhone2,1":
            print("iPhone 3GS")
            return .iPhone_3GS

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

        case "iPhone7,1":
            print("iPhone 6 Plus")
            return .iPhone_6_Plus

        case "iPhone7,2":
            print("iPhone 6")
            return .iPhone_6

        case "iPhone8,1":
            print("iPhone 6s")
            return .iPhone_6s

        case "iPhone8,2":
            print("iPhone 6s Plus")
            return .iPhone_6s_Plus

        case "iPhone8,4":
            print("iPhone SE")
            return .iPhone_SE

        case "iPhone9,1", "iPhone9,3":
            print("iPhone 7")
            return .iPhone_7

        case "iPhone9,2", "iPhone9,4":
            print("iPhone 7 Plus")
            return .iPhone_7_Plus

        case "iPhone10,1", "iPhone10,4":
            print("iPhone 8")
            return .iPhone_8

        case "iPhone10,2", "iPhone10,5":
            print("iPhone 8 Pllus")
            return .iPhone_8_Plus

        case "iPhone10,3", "iPhone10,6":
            print("iPhone X")
            return .iPhone_X

        case "iPhone11,2":
            print("iPhone XS")
            return .iPhone_XS

        case "iPhone11,4", "iPhone11,6":
            print("iPhone XS Max")
            return .iPhone_XS_Max

        case "iPhone11,8":
            print("iPhone XR")
            return .iPhone_XR

        case "iPhone12,1":
            print("iPhone 11")
            return .iPhone_11

        case "iPhone12,3":
            print("iPhone 11 Pro")
            return .iPhone_11_Pro

        case "iPhone12,5":
            print("iPhone 11 Pro Max")
            return .iPhone_11_Pro_Max

        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":
            print("iPad 2")
            return .iPad_2

        case "iPad2,5", "iPad2,6", "iPad2,7":
            print("iPad Mini")
            return .iPad_Mini

        case "iPad3,1", "iPad3,2", "iPad3,3":
            print("iPad 3")
            return .iPad_3

        case "iPad3,4", "iPad3,5", "iPad3,6":
            print("iPad 4")
            return .iPad_4

        case "iPad4,1", "iPad4,2", "iPad4,3":
            print("iPad Air")
            return .iPad_Air

        case "iPad4,4", "iPad4,5", "iPad4,6":
            print("iPad Mini 2")
            return .iPad_Mini_2

        case "iPad4,7", "iPad4,8", "iPad4,9":
            print("iPad Mini 3")
            return .iPad_Mini_3

        case "iPad5,1", "iPad5,2":
            print("iPad Mini 4")
            return .iPad_Mini_4

        case "iPad5,3", "iPad5,4":
            print("iPad Air 2")
            return .iPad_Air_2

        case "iPad6,3", "iPad6,4":
            print("iPad Pro 9.7")
            return .iPad_Pro_97

        case "iPad6,7", "iPad6,8":
            print("iPad Pro 12.9")
            return .iPad_Pro_129

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

    private static var deviceIdentifier: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        return identifier
    }

}


//  MARK: Device informations
extension UIDevice {
    /**
     打印当前设备信息
     */
    @available(*, deprecated, message: "Extensions directly on UIDevice are deprecated. Use `UIDevice.rat.deviceInformations` instead.", renamed: "rat.deviceInformations")
    public static func rat_deviceInformations() {
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
