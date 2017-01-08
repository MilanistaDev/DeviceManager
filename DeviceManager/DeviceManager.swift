//
//  DeviceManager.swift
//  DeviceManager
//
//  Created by Takuya Aso on 2017/01/09.
//  Copyright © 2017年 Takuya Aso. All rights reserved.
//

import UIKit

// アプリ対応端末 enum
enum DeviceType: Int {
    case Unknown = 0
    case iPhone4S
    case iPhone5
    case iPhone5c
    case iPhone5s
    case iPhone6Plus
    case iPhone6
    case iPhone6s
    case iPhone6sPlus
    case iPhoneSE
    case iPhone7
    case iPhone7Plus
    case iPad3
    case iPad4
    case iPadAir
    case iPadAir2
    case iPadmini1
    case iPadmini2
    case iPadmini3
    case iPadmini4
    case iPadPro9_7
    case iPadPro12_9
    case iPodtouch5
    case iPodtouch6
}

class DeviceManager: NSObject {

    /**
     * iOS端末のモデル名を返す
     * 例：iPhone5,1
     * @return iOS端末のモデル名
     */
    class func currentDeviceIdentifierName() -> String {

        var platformName = ""
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        platformName = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        return platformName
    }

    /**
     * iOS端末の種類を返す(enum対応)
     * @return 対応する端末のenum値
     */
    class func currentDeviceType() -> DeviceType {

        let machineName = self.currentDeviceIdentifierName()
        var deviceType:DeviceType = .Unknown

        switch machineName {
        case "iPhone4,1":
            deviceType = .iPhone4S
        case "iPhone5,1":
            deviceType = .iPhone5
        case "iPhone5,2":
            deviceType = .iPhone5
        case "iPhone5,3":
            deviceType = .iPhone5c
        case "iPhone5,4":
            deviceType = .iPhone5c
        case "iPhone6,1":
            deviceType = .iPhone5s
        case "iPhone6,2":
            deviceType = .iPhone5s
        case "iPhone7,1":
            deviceType = .iPhone6Plus
        case "iPhone7,2":
            deviceType = .iPhone6
        case "iPhone8,1":
            deviceType = .iPhone6s
        case "iPhone8,2":
            deviceType = .iPhone6sPlus
        case "iPhone8,4":
            deviceType = .iPhoneSE
        case "iPhone9,1":
            deviceType = .iPhone7
        case "iPhone9,2":
            deviceType = .iPhone7Plus
        case "iPad2,5":
            deviceType = .iPadmini1
        case "iPad2,6":
            deviceType = .iPadmini1
        case "iPad2,7":
            deviceType = .iPadmini1
        case "iPad3,1":
            deviceType = .iPad3
        case "iPad3,2":
            deviceType = .iPad3
        case "iPad3,3":
            deviceType = .iPad3
        case "iPad3,4":
            deviceType = .iPad4
        case "iPad3,5":
            deviceType = .iPad4
        case "iPad3,6":
            deviceType = .iPad4
        case "iPad4,1":
            deviceType = .iPadAir
        case "iPad4,2":
            deviceType = .iPadAir
        case "iPad4,3":
            deviceType = .iPadAir
        case "iPad4,4":
            deviceType = .iPadmini2
        case "iPad4,5":
            deviceType = .iPadmini2
        case "iPad4,6":
            deviceType = .iPadmini2
        case "iPad4,7":
            deviceType = .iPadmini3
        case "iPad4,8":
            deviceType = .iPadmini3
        case "iPad4,9":
            deviceType = .iPadmini3
        case "iPad5,1":
            deviceType = .iPadmini4
        case "iPad5,2":
            deviceType = .iPadmini4
        case "iPad5,3":
            deviceType = .iPadAir2
        case "iPad5,4":
            deviceType = .iPadAir2
        case "iPad6,4":
            deviceType = .iPadPro9_7
        case "iPad6,7":
            deviceType = .iPadPro12_9
        case "iPad6,8":
            deviceType = .iPadPro12_9
        case "iPod5,1":
            deviceType = .iPodtouch5
        case "iPod7,1":
            deviceType = .iPodtouch6
        default:
            deviceType = .Unknown
        }
        return deviceType
    }
}
