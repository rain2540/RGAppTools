//
//  UIScrollView+RGCapture.swift
//  RGAppTools
//
//  Created by RAIN on 2019/10/24.
//  Copyright © 2019 Smartech. All rights reserved.
//

import Foundation
import WebKit

public extension UIScrollView {

    func rat_ContentCapture(_ completionHandler: @escaping (_ capturedImage: UIImage?) -> Void) {

        self.isCapturing = true

        // Put a fake Cover of View
        let snapShotView = self.snapshotView(afterScreenUpdates: false)
        snapShotView?.frame = CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: (snapShotView?.frame.size.width)!, height: (snapShotView?.frame.size.height)!)
        self.superview?.addSubview(snapShotView!)

        // Backup all properties of scrollview if needed
        let bakFrame     = self.frame
        let bakOffset    = self.contentOffset
        let bakSuperView = self.superview
        let bakIndex     = self.superview?.subviews.firstIndex(of: self)

        // Scroll To Bottom show all cached view
        if self.frame.size.height < self.contentSize.height {
            self.contentOffset = CGPoint(x: 0, y: self.contentSize.height - self.frame.size.height)
        }

        self.rat_RenderImageView({ [weak self] (capturedImage) -> Void in
            // Recover View

            let strongSelf = self!

            strongSelf.removeFromSuperview()
            strongSelf.frame = bakFrame
            strongSelf.contentOffset = bakOffset
            bakSuperView?.insertSubview(strongSelf, at: bakIndex!)

            snapShotView?.removeFromSuperview()

            strongSelf.isCapturing = false

            completionHandler(capturedImage)
        })

    }

    fileprivate func rat_RenderImageView(_ completionHandler: @escaping (_ capturedImage: UIImage?) -> Void) {
        // Rebuild scrollView superView and their hold relationship
        let swTempRenderView = UIView(frame: CGRect(x: 0, y: 0, width: self.contentSize.width, height: self.contentSize.height))
        self.removeFromSuperview()
        swTempRenderView.addSubview(self)

        self.contentOffset = CGPoint.zero
        self.frame         = swTempRenderView.bounds

        // Swizzling setFrame
        let method: Method = class_getInstanceMethod(object_getClass(self), #selector(setter: UIView.frame))!
        let swizzledMethod: Method = class_getInstanceMethod(object_getClass(self), #selector(setter: UIView.frame))!
        method_exchangeImplementations(method, swizzledMethod)

        // Sometimes ScrollView will Capture nothing without defer;
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(0.3 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)) { () -> Void in
            let bounds = self.bounds
            UIGraphicsBeginImageContextWithOptions(bounds.size, false, UIScreen.main.scale)

            if (self.rat_ContainsWKWebView()) {
                self.drawHierarchy(in: bounds, afterScreenUpdates: true)
            } else {
                self.layer.render(in: UIGraphicsGetCurrentContext()!)
            }
            let capturedImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()

            method_exchangeImplementations(swizzledMethod, method)

            completionHandler(capturedImage)
        }
    }


    // Simulate People Action, all the `fixed` element will be repeate
    // SwContentCapture will capture all content without simulate people action, more perfect.
    func rat_ContentScrollCapture(_ completionHandler: @escaping (_ capturedImage: UIImage?) -> Void) {

        self.isCapturing = true

        // Put a fake Cover of View
        let snapShotView = self.snapshotView(afterScreenUpdates: true)
        snapShotView?.frame = CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: (snapShotView?.frame.size.width)!, height: (snapShotView?.frame.size.height)!)
        self.superview?.addSubview(snapShotView!)

        // Backup
        let bakOffset    = self.contentOffset

        // Divide
        let page  = floorf(Float(self.contentSize.height / self.bounds.height))

        UIGraphicsBeginImageContextWithOptions(self.contentSize, false, UIScreen.main.scale)

        self.rat_ContentScrollPageDraw(0, maxIndex: Int(page), drawCallback: { [weak self] () -> Void in
            let strongSelf = self

            let capturedImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()

            // Recover
            strongSelf?.setContentOffset(bakOffset, animated: false)
            snapShotView?.removeFromSuperview()

            strongSelf?.isCapturing = false

            completionHandler(capturedImage)
            })

    }

    fileprivate func rat_ContentScrollPageDraw (_ index: Int, maxIndex: Int, drawCallback: @escaping () -> Void) {

        self.setContentOffset(CGPoint(x: 0, y: CGFloat(index) * self.frame.size.height), animated: false)
        let splitFrame = CGRect(x: 0, y: CGFloat(index) * self.frame.size.height, width: bounds.size.width, height: bounds.size.height)

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(0.3 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)) { () -> Void in
            self.drawHierarchy(in: splitFrame, afterScreenUpdates: true)

            if index < maxIndex {
                self.rat_ContentScrollPageDraw(index + 1, maxIndex: maxIndex, drawCallback: drawCallback)
            } else {
                drawCallback()
            }
        }
    }
}

public extension UIWebView {

    func rat_ContentCapture (_ completionHandler: @escaping (_ capturedImage: UIImage?) -> Void) {
        self.scrollView.rat_ContentCapture(completionHandler)
    }

    func rat_ContentScrollCapture (_ completionHandler: @escaping (_ capturedImage: UIImage?) -> Void) {
        self.scrollView.rat_ContentScrollCapture(completionHandler)
    }

}
