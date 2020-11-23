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
    
    /// 判断设备 UI 类型是否为 iPhone X 系列
    public static var isIPhoneXSeriesUI: Bool {
        var iPhoneXSeries = false
        if UIDevice.rat.isPhoneOrPodUI == false {
            return iPhoneXSeries
        }
        
        if #available(iOS 11.0, *) {
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
    
    /// 判断设备 UI 类型是否为 iPad
    public static var isPadUI: Bool {
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
    // ***** unknown devices ***** //
    case unknown    =   "unknown",
    unknownPhone    =   "unknown iPhone",
    unknownPad      =   "unknown iPad",
    unknownPod      =   "unknown iPod",

    // ***** ***** iPhone ***** ***** //
    iPhone_2G           =   "iPhone",
    iPhone_3G           =   "iPhone 3G",
    iPhone_3GS          =   "iPhone 3GS",
    iPhone_4            =   "iPhone 4",
    iPhone_4S           =   "iPhone 4S",
    iPhone_5            =   "iPhone 5",
    iPhone_5c           =   "iPhone 5c",
    iPhone_5s           =   "iPhone 5s",
    iPhone_6            =   "iPhone 6",
    iPhone_6_Plus       =   "iPhone 6 Plus",
    iPhone_6s           =   "iPhone 6s",
    iPhone_6s_Plus      =   "iPhone 6s Plus",
    iPhone_SE_1         =   "iPhone SE (1st generation)",
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
    iPhone_SE_2         =   "iPhone SE (2nd generation)",
    iPhone_12_mini      =   "iPhone 12 mini",
    iPhone_12           =   "iPhone 12",
    iPhone_12_Pro       =   "iPhone 12 Pro",
    iPhone_12_Pro_Max   =   "iPhone 12 Pro Max",

    // ***** ***** iPad ***** ***** //
    iPad_1          =   "iPad",
    iPad_2          =   "iPad 2",
    iPad_3          =   "iPad (3rd generation)",
    iPad_4          =   "iPad (4th generation)",
    iPad_5          =   "iPad (5th generation)",
    iPad_6          =   "iPad (6th generation)",
    iPad_7          =   "iPad (7th generation)",
    iPad_8          =   "iPad (8th generation)",
    // iPad mini
    iPad_mini_1     =   "iPad mini",
    iPad_mini_2     =   "iPad mini 2",
    iPad_mini_3     =   "iPad mini 3",
    iPad_mini_4     =   "iPad mini 4",
    iPad_mini_5     =   "iPad mini (5th generation)",
    // iPad Air
    iPad_Air_1      =   "iPad Air",
    iPad_Air_2      =   "iPad Air 2",
    iPad_Air_3      =   "iPad Air (3rd generation)",
    iPad_Air_4      =   "iPad Air (4th generation)",
    // iPad Pro
    iPad_Pro_129_1  =   "iPad Pro (12.9-inch)",
    iPad_Pro_97_1   =   "iPad Pro (9.7-inch)",
    iPad_Pro_129_2  =   "iPad Pro (12.9-inch) (2nd generation)",
    iPad_Pro_105    =   "iPad Pro (10.5-inch)",
    iPad_Pro_11_1   =   "iPad Pro (11-inch)",
    iPad_Pro_129_3  =   "iPad Pro (12.9-inch) (3rd generation)",
    iPad_Pro_11_2   =   "iPad Pro (11-inch) (2nd generation)",
    iPad_Pro_129_4  =   "iPad Pro (12.9-inch) (4th generation)",

    // ***** ***** iPod touch ***** ***** //
    iPod_touch_1    =   "iPod touch",
    iPod_touch_2    =   "iPod touch (2nd generation)",
    iPod_touch_3    =   "iPod touch (3rd generation)",
    iPod_touch_4    =   "iPod touch (4th generation)",
    iPod_touch_5    =   "iPod touch (5th generation)",
    iPod_touch_6    =   "iPod touch (6th generation)",
    iPod_touch_7    =   "iPod touch (7th generation)",

    // ***** other devices ***** //
    //  Apple TV
    Apple_TV,
    //  Simulator
    simulator_32bit,
    simulator_64bit
}


extension RGAppTools where Base: UIDevice {

    /// 获取描述设备类型的字符串
    public static var deviceTypeValue: String {
        switch deviceType {
        case .unknown, .unknownPhone, .unknownPad, .unknownPod:
            return deviceIdentifier

        default:
            return deviceType.rawValue
        }
    }

    /// 获取设备类型
    public static var deviceType: DeviceType {
        if isPhoneOrPodUI {
            if deviceIdentifier.hasPrefix("iPhone") {
                return iPhoneType
            } else if deviceIdentifier.hasPrefix("iPod") {
                return iPodType
            }
        } else if isPadUI {
            return iPadType
        }

        switch deviceIdentifier {
        case "AppleTV5,3":
            print(DeviceType.Apple_TV.rawValue)
            return .Apple_TV

        case "i386":
            print(DeviceType.simulator_32bit.rawValue)
            return .simulator_32bit

        case "x86_64":
            print(DeviceType.simulator_64bit.rawValue)
            return .simulator_64bit

        default:
            print(deviceIdentifier)
            return .unknown
        }
    }

    /// 获取 iPhone 类型
    public static var iPhoneType: DeviceType {
        switch deviceIdentifier {
        case "iPhone1,1":
            print(DeviceType.iPhone_2G.rawValue)
            return .iPhone_2G

        case "iPhone1,2":
            print(DeviceType.iPhone_3G.rawValue)
            return .iPhone_3G

        case "iPhone2,1":
            print(DeviceType.iPhone_3GS.rawValue)
            return .iPhone_3GS

        case "iPhone3,1", "iPhone3,2", "iPhone3,3":
            print(DeviceType.iPhone_4.rawValue)
            return .iPhone_4

        case "iPhone4,1":
            print(DeviceType.iPhone_4S.rawValue)
            return .iPhone_4S

        case "iPhone5,1", "iPhone5,2":
            print(DeviceType.iPhone_5.rawValue)
            return .iPhone_5

        case "iPhone5,3", "iPhone5,4":
            print(DeviceType.iPhone_5c.rawValue)
            return .iPhone_5c

        case "iPhone6,1", "iPhone6,2":
            print(DeviceType.iPhone_5s.rawValue)
            return .iPhone_5s

        case "iPhone7,1":
            print(DeviceType.iPhone_6_Plus.rawValue)
            return .iPhone_6_Plus

        case "iPhone7,2":
            print(DeviceType.iPhone_6.rawValue)
            return .iPhone_6

        case "iPhone8,1":
            print(DeviceType.iPhone_6s.rawValue)
            return .iPhone_6s

        case "iPhone8,2":
            print(DeviceType.iPhone_6s_Plus.rawValue)
            return .iPhone_6s_Plus

        case "iPhone8,4":
            print(DeviceType.iPhone_SE_1.rawValue)
            return .iPhone_SE_1

        case "iPhone9,1", "iPhone9,3":
            print(DeviceType.iPhone_7.rawValue)
            return .iPhone_7

        case "iPhone9,2", "iPhone9,4":
            print(DeviceType.iPhone_7_Plus.rawValue)
            return .iPhone_7_Plus

        case "iPhone10,1", "iPhone10,4":
            print(DeviceType.iPhone_8.rawValue)
            return .iPhone_8

        case "iPhone10,2", "iPhone10,5":
            print(DeviceType.iPhone_8_Plus.rawValue)
            return .iPhone_8_Plus

        case "iPhone10,3", "iPhone10,6":
            print(DeviceType.iPhone_X.rawValue)
            return .iPhone_X

        case "iPhone11,2":
            print(DeviceType.iPhone_XS.rawValue)
            return .iPhone_XS

        case "iPhone11,4", "iPhone11,6":
            print(DeviceType.iPhone_XS_Max.rawValue)
            return .iPhone_XS_Max

        case "iPhone11,8":
            print(DeviceType.iPhone_XR.rawValue)
            return .iPhone_XR

        case "iPhone12,1":
            print(DeviceType.iPhone_11.rawValue)
            return .iPhone_11

        case "iPhone12,3":
            print(DeviceType.iPhone_11_Pro.rawValue)
            return .iPhone_11_Pro

        case "iPhone12,5":
            print(DeviceType.iPhone_11_Pro_Max.rawValue)
            return .iPhone_11_Pro_Max

        default:
            print(deviceIdentifier)
            return .unknownPhone
        }
    }

    /// 获取 iPad 类型
    public static var iPadType: DeviceType {
        switch deviceIdentifier {
        // ***** ***** iPad ***** ***** //
        case "iPad1,1":
            print(DeviceType.iPad_1.rawValue)
            return .iPad_1

        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":
            print(DeviceType.iPad_2.rawValue)
            return .iPad_2

        case "iPad3,1", "iPad3,2", "iPad3,3":
            print(DeviceType.iPad_3.rawValue)
            return .iPad_3

        case "iPad3,4", "iPad3,5", "iPad3,6":
            print(DeviceType.iPad_4.rawValue)
            return .iPad_4

        case "iPad6,11", "iPad6,12":
            print(DeviceType.iPad_5.rawValue)
            return .iPad_5

        case "iPad7,5", "iPad7,6":
            print(DeviceType.iPad_6.rawValue)
            return .iPad_6

        case "iPad7,11", "iPad7,12":
            print(DeviceType.iPad_7.rawValue)
            return .iPad_7

        // ***** ***** iPad mini ***** ***** //
        case "iPad2,5", "iPad2,6", "iPad2,7":
            print(DeviceType.iPad_mini_1.rawValue)
            return .iPad_mini_1

        case "iPad4,4", "iPad4,5", "iPad4,6":
            print(DeviceType.iPad_mini_2.rawValue)
            return .iPad_mini_2

        case "iPad4,7", "iPad4,8", "iPad4,9":
            print(DeviceType.iPad_mini_3.rawValue)
            return .iPad_mini_3

        case "iPad5,1", "iPad5,2":
            print(DeviceType.iPad_mini_4.rawValue)
            return .iPad_mini_4

        case "iPad11,1", "iPad11,2":
            print(DeviceType.iPad_mini_5.rawValue)
            return .iPad_mini_5

        // ***** ***** iPad Air ***** ***** //
        case "iPad4,1", "iPad4,2", "iPad4,3":
            print(DeviceType.iPad_Air_1.rawValue)
            return .iPad_Air_1

        case "iPad5,3", "iPad5,4":
            print(DeviceType.iPad_Air_2.rawValue)
            return .iPad_Air_2

        case "iPad11,3", "iPad11,4":
            print(DeviceType.iPad_Air_3.rawValue)
            return .iPad_Air_3

        // ***** ***** iPad Pro ***** ***** //
        case "iPad6,7", "iPad6,8":
            print(DeviceType.iPad_Pro_129_1.rawValue)
            return .iPad_Pro_129_1

        case "iPad6,3", "iPad6,4":
            print(DeviceType.iPad_Pro_97_1.rawValue)
            return .iPad_Pro_97_1

        case "iPad7,1", "iPad7,2":
            print(DeviceType.iPad_Pro_129_2.rawValue)
            return .iPad_Pro_129_2

        case "iPad7,3", "iPad7,4":
            print(DeviceType.iPad_Pro_105.rawValue)
            return .iPad_Pro_105

        case "iPad8,5", "iPad8,6", "iPad8,7", "iPad8,8":
            print(DeviceType.iPad_Pro_129_3.rawValue)
            return .iPad_Pro_129_3

        case "iPad8,1", "iPad8,2", "iPad8,3", "iPad8,4":
            print(DeviceType.iPad_Pro_11_1.rawValue)
            return .iPad_Pro_11_1

        default:
            print(deviceIdentifier)
            return .unknownPad
        }
    }

    /// 获取 iPod 类型
    public static var iPodType: DeviceType {
        switch deviceIdentifier {
        case "iPod1,1":
            print(DeviceType.iPod_touch_1.rawValue)
            return .iPod_touch_1

        case "iPod2,1":
            print(DeviceType.iPod_touch_2.rawValue)
            return .iPod_touch_2

        case "iPod3,1":
            print(DeviceType.iPod_touch_3.rawValue)
            return .iPod_touch_3

        case "iPod4,1":
            print(DeviceType.iPod_touch_4.rawValue)
            return .iPod_touch_4

        case "iPod5,1":
            print(DeviceType.iPod_touch_5.rawValue)
            return .iPod_touch_5

        case "iPod7,1":
            print(DeviceType.iPod_touch_6.rawValue)
            return .iPod_touch_6

        case "iPod9,1":
            print(DeviceType.iPod_touch_7.rawValue)
            return .iPod_touch_7

        default:
            print(deviceIdentifier)
            return .unknownPod
        }
    }

    /// 设备标识
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
