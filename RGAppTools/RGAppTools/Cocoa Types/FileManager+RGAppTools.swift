//
//  FileManager+RGAppTools.swift
//  RGAppTools
//
//  Created by RAIN on 2017/3/29.
//  Copyright © 2017年 Smartech. All rights reserved.
//

import Foundation

extension FileManager {
    public static var cachesPath: String? {
        return kDefaultFileManager.urls(for: .cachesDirectory, in: .userDomainMask).first?.path
    }
}
