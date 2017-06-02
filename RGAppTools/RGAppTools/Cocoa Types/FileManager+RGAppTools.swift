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
    
    /// Documents 文件夹路径
    public static var documentsPath: String? {
        return kDefaultFileManager.urls(for: .documentDirectory, in: .userDomainMask).first?.path
    }
    
    /// Caches 文件夹路径
    public static var cachesPath: String? {
        return kDefaultFileManager.urls(for: .cachesDirectory, in: .userDomainMask).first?.path
    }
    
    /// Temporary 文件夹路径
    public static var temporaryPath: String {
        return NSTemporaryDirectory()
    }
    
    public static var cacheSize: String {
        guard let cachePath = FileManager.rat.cachesPath else {
            print("FileManager get cache path failed.")
            return "0"
        }
        guard let fileNames = kDefaultFileManager.subpaths(atPath: cachePath) else {
            print("FileManager get cache files failed.")
            return "0"
        }
        var size: Int = 0
        for fileName in fileNames {
            //  把文件名拼接到路径中
            let path = cachePath.appendingFormat("/\(fileName)")
            do {
                //  取出文件属性
                let fileAttributes = try kDefaultFileManager.attributesOfItem(atPath: path)
                //  取出文件大小属性
                for (key, value) in fileAttributes {
                    if key == FileAttributeKey.size {
                        //  取出文件大小进行累加
                        size += Int(value as! NSNumber)
                    }
                }
            } catch let error as NSError {
                print("FileManager get cache file attributes failed with error: \n", error)
            }
        }
        return "\(size / (1024 * 1024)) M"
    }
    
}
