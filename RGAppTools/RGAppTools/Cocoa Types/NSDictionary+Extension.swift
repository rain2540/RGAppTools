//
//  NSDictionary+Extension.swift
//  RGAppTools
//
//  Created by RAIN on 16/2/5.
//  Copyright © 2016年 Smartech. All rights reserved.
//

import Foundation

extension NSDictionary {
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
