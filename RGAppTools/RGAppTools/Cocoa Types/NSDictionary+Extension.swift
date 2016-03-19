//
//  NSDictionary+Extension.swift
//  RGAppTools
//
//  Created by RAIN on 16/2/5.
//  Copyright © 2016年 Smartech. All rights reserved.
//

import Foundation

extension NSDictionary {
    convenience init?(mainBundlePathForResource name: String?, ofType ext: String?) {
        guard let path = NSBundle.mainBundle().pathForResource(name, ofType: ext) else {
            print("RGApptools: NSDictionary init with main bundle path for resource of type is nil")
            return nil
        }
        self.init(contentsOfFile: path)
    }
}
