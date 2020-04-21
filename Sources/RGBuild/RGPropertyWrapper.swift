//
//  RGPropertyWrapper.swift
//  RGAppTools
//
//  Created by RAIN on 2020/4/21.
//  Copyright © 2020 Smartech. All rights reserved.
//

import Foundation


public struct RGPropertyWrapper {

    @propertyWrapper
    public struct UserDefault<T> {
        let key: String
        let defaultValue: T

        public var wrappedValue: T {
            get {
                return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
            }
            set {
                UserDefaults.standard.set(newValue, forKey: key)
            }
        }

        public init(key: String, defaultValue: T) {
            self.key = key
            self.defaultValue = defaultValue
        }
    }

}
