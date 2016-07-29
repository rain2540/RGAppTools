//
//  NSDictionary+RGAppTools.swift
//  RGAppTools
//
//  Created by RAIN on 16/2/5.
//  Copyright © 2016年 Smartech. All rights reserved.
//

import Foundation

//  TODO: Add MARK: for this extension of NSDictionary
extension NSDictionary {
    //  TODO: update this comment
    /**
     获取 Main Bundle 中某个文件的路径
     
     - parameter name: 文件名
     - parameter ext:  文件扩展名
     
     - returns: 文件路径
     */
    convenience init?(mainBundlePathForResource name: String?, ofType ext: String?) {
        guard let path = NSBundle.mainBundle().pathForResource(name, ofType: ext) else {
            print("RGApptools: NSDictionary init with main bundle path for resource of type is nil")
            return nil
        }
        self.init(contentsOfFile: path)
    }
}

//  MARK: Ckeck key exist or not
extension NSDictionary {
    /**
     检验 NSDictionary 中是否存在某个 key
     
     - parameter key: 待检验的 key
     
     - returns: 检验结果的布尔值
     */
    func rg_isHaveKey(key: String) -> Bool {
        let keys = self.allKeys as! [String]
        for aKey: String in keys {
            if key == aKey {
                return true
            }
        }
        return false
    }
}