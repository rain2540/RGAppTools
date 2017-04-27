//
//  FileManager+RGAppTools.swift
//  RGAppTools
//
//  Created by RAIN on 2017/3/29.
//  Copyright © 2017年 Smartech. All rights reserved.
//

import Foundation

extension RGAppTools where Base: FileManager {
    
    /// Home Directory 文件夹的路径
    public static var homeDirectoryPath: String {
        return NSHomeDirectory()
    }
    
    /// Caches 文件夹路径
    public static var cachesPath: String? {
        return kDefaultFileManager.urls(for: .cachesDirectory, in: .userDomainMask).first?.path
    }

    public static var cacheSize: String {
        var size: Int = 0
        return "\(size / (1024 * 1024)) M"
    }

}
