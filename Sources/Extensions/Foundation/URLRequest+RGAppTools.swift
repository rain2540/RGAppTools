//
//  URLRequest+RGAppTools.swift
//  RGAppTools
//
//  Created by RAIN on 2021/7/26.
//  Copyright © 2021 Smartech. All rights reserved.
//

import Foundation

extension URLRequest {

    public init?(rat_urlString string: String) {
        guard let url = URL(string: string) else {
            return nil
        }
        self.init(url: url)
    }

}
