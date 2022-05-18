//
//  WKWebView+RGAppTools.swift
//  RGAppTools
//
//  Created by RAIN on 2021/7/26.
//  Copyright © 2021 Smartech. All rights reserved.
//

import UIKit
import WebKit

extension RGAppTools where Base: WKWebView {
  
  public func load(urlString: String) throws {
    guard let request = URLRequest(rat_urlString: urlString) else {
      throw RATError.initNil
    }
    base.load(request)
  }
  
}
