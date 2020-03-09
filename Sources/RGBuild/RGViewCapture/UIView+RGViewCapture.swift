//
//  UIView+RGViewCapture.swift
//  RGAppTools
//
//  Created by RAIN on 2019/10/24.
//  Copyright © 2019 Smartech. All rights reserved.
//

import UIKit
import WebKit
import ObjectiveC

private var RGViewCaptureKey_IsCapturing: String = "RGViewCapture_AssoKey_isCapturing"

public extension UIView {

    @objc func rat_SetFrame(_ frame: CGRect) {
        // Do nothing, use for swizzling
    }

    var isCapturing: Bool! {
        get {
            let num = objc_getAssociatedObject(self, &RGViewCaptureKey_IsCapturing)
            if num == nil {
                return false
            }

            if let numObj = num as? NSNumber {
                return numObj.boolValue
            } else {
                return false
            }
        }
        set(newValue) {
            let num = NSNumber(value: newValue as Bool)
            objc_setAssociatedObject(self, &RGViewCaptureKey_IsCapturing, num, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

    // Ref: chromium source - snapshot_manager, fix wkwebview screenshot bug.
    // https://chromium.googlesource.com/chromium/src.git/+/46.0.2478.0/ios/chrome/browser/snapshots/snapshot_manager.mm
    func rat_ContainsWKWebView() -> Bool {
        if self.isKind(of: WKWebView.self) {
            return true
        }
        for subView in self.subviews {
            if (subView.rat_ContainsWKWebView()) {
                return true
            }
        }
        return false
    }

    func rat_Capture(_ completionHandler: (_ capturedImage: UIImage?) -> Void) {

        self.isCapturing = true

        let bounds = self.bounds

        UIGraphicsBeginImageContextWithOptions(bounds.size, false, UIScreen.main.scale)

        let context = UIGraphicsGetCurrentContext()
        context?.saveGState()
        context?.translateBy(x: -self.frame.origin.x, y: -self.frame.origin.y);

        if (rat_ContainsWKWebView()) {
            self.drawHierarchy(in: bounds, afterScreenUpdates: true)
        } else {
            self.layer.render(in: context!)
        }
        let capturedImage = UIGraphicsGetImageFromCurrentImageContext()

        context?.restoreGState();
        UIGraphicsEndImageContext()

        self.isCapturing = false

        completionHandler(capturedImage)
    }
}
