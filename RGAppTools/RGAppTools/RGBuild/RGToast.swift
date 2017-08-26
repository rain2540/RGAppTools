//
//  RGToast.swift
//  RGAppTools
//
//  Created by RAIN on 2017/8/22.
//  Copyright © 2017年 Smartech. All rights reserved.
//

import UIKit

//  MARK: RGToast
class RGToast: NSObject {
    static public let shared = RGToast()

    private var toastContents: Array<[CanBeToast]> = []
    private var active = false
    private var toastView: RGToastView?
    private var toastFrame = UIScreen.main.bounds

    //  MARK: Lifecycle
    override private init() {
        super.init()
        NotificationCenter.default
            .addObserver(self,
                         selector: #selector(RGToast.keyboardWillAppear(notification:)),
                         name: NSNotification.Name.UIKeyboardWillShow,
                         object: nil)

        NotificationCenter.default
            .addObserver(self,
                         selector: #selector(RGToast.keyboardWillDisappear(notification:)),
                         name: NSNotification.Name.UIKeyboardDidHide,
                         object: nil)

        NotificationCenter.default
            .addObserver(self,
                         selector: #selector(RGToast.orientationWillChange(notification:)),
                         name: NSNotification.Name.UIApplicationWillChangeStatusBarOrientation,
                         object: nil)
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    // MARK: Public Method
    public func toast(message: String?, image: UIImage? = nil) {
        if message != nil && image != nil  {
            toastContents.append([message!, image!])
        } else if message != nil {
            toastContents.append([message!])
        } else if image != nil {
            toastContents.append([image!])
        }
        if !active {
            showToast()
        }
    }

    //  MARK: Show Toast Message
    private func showToast() {
        if toastContents.count < 1 {
            active = false
            return
        }

        active = true
        toastView = RGToastView()
        let contents = toastContents[0]

        var img: UIImage? = nil
        if contents.count > 1 {
            img = toastContents[0][1] as? UIImage
            toastView?.image = img
        }

        if contents.count > 0 {
            toastView?.messageText = toastContents[0][0] as? String
        }
        toastView?.transform = CGAffineTransform.identity
        toastView?.alpha = 0.0
        toastView?.center = CGPoint(x: toastFrame.midX, y: toastFrame.midY)
        UIApplication.shared.keyWindow?.addSubview(toastView!)

        let orientation = UIApplication.shared.statusBarOrientation
        let degress = rotationDegress(orientation: orientation)
        toastView?.transform = CGAffineTransform(rotationAngle: degress * .pi / 180.0)
        toastView?.transform.scaledBy(x: 2.0, y: 2.0)

        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(0.15)
        UIView.setAnimationDelegate(self)
        UIView.setAnimationDidStop(#selector(RGToast.animationStep2))
        toastView?.transform = CGAffineTransform(rotationAngle: degress * .pi / 180.0)
        toastView?.frame = (toastView?.frame.integral)!
        toastView?.alpha = 1.0
        UIView.commitAnimations()
    }

    @objc private func animationStep2() {
        UIView.beginAnimations(nil, context: nil)
        let words = (toastContents[0][0] as! String).components(separatedBy: CharacterSet.whitespaces)
        let duration = max(Double(words.count) * 60.0 / 200.0, 1.4)

        UIView.setAnimationDelay(duration)
        UIView.setAnimationDelegate(self)
        UIView.setAnimationDidStop(#selector(RGToast.animationStep3))

        let orientation = UIApplication.shared.statusBarOrientation
        let degress = rotationDegress(orientation: orientation)
        toastView?.transform = CGAffineTransform(rotationAngle: degress * .pi / 180.0)
        toastView?.transform.scaledBy(x: 0.5, y: 0.5)
        toastView?.alpha = 0.0
        UIView.commitAnimations()
    }

    @objc private func animationStep3() {
        toastView?.removeFromSuperview()
        toastContents.remove(at: 0)
        showToast()
    }

    //  MARK: System Observation Changes
    private func subtractRect(screenFrame: CGRect, keyboardFrame: CGRect) -> CGRect {
        var vKeyboardFrame = keyboardFrame
        if CGPoint.zero != vKeyboardFrame.origin {
            if vKeyboardFrame.origin.x > 0 {
                vKeyboardFrame.size.width = keyboardFrame.origin.x
            }
            if vKeyboardFrame.origin.y > 0 {
                vKeyboardFrame.size.height = keyboardFrame.origin.y
            }
            vKeyboardFrame.origin = CGPoint.zero
        } else {
            vKeyboardFrame.origin.x = fabs(keyboardFrame.size.width - screenFrame.size.width)
            vKeyboardFrame.origin.y = fabs(keyboardFrame.size.height - screenFrame.size.height)

            if vKeyboardFrame.origin.x > 0 {
                let temp = vKeyboardFrame.origin.x
                vKeyboardFrame.origin.x = vKeyboardFrame.size.width
                vKeyboardFrame.size.width = temp
            } else if vKeyboardFrame.origin.y > 0 {
                let temp = vKeyboardFrame.origin.y
                vKeyboardFrame.origin.y = vKeyboardFrame.size.height
                vKeyboardFrame.size.height = temp
            }
        }
        return screenFrame.intersection(vKeyboardFrame)
    }

    //  MARK: Target - Action
    @objc private func keyboardWillAppear(notification: Notification) {
        let userInfo = notification.userInfo
        let aValue = userInfo?[UIKeyboardFrameEndUserInfoKey] as! NSValue
        let keyboardFrame = aValue.cgRectValue
        let screenFrame = UIScreen.main.bounds

        UIView.beginAnimations(nil, context: nil)
        toastFrame = subtractRect(screenFrame: screenFrame, keyboardFrame: keyboardFrame)
        toastView?.center = CGPoint(x: toastFrame.midX, y: toastFrame.midY)
        UIView.commitAnimations()
    }

    @objc private func keyboardWillDisappear(notification: Notification) {
        toastFrame = UIScreen.main.bounds
    }

    @objc private func orientationWillChange(notification: Notification) {
        let userInfo = notification.userInfo
        let v = userInfo?[UIApplicationStatusBarOrientationUserInfoKey] as! NSNumber
        let o = UIInterfaceOrientation(rawValue: v.intValue)

        let degress = rotationDegress(orientation: o!)

        UIView.beginAnimations(nil, context: nil)
        toastView?.transform = CGAffineTransform(rotationAngle: degress * .pi / 180.0)
        toastView?.frame = CGRect(x: (toastView?.frame.minX)!, y: (toastView?.frame.minY)!, width: (toastView?.frame.width)!, height: (toastView?.frame.height)!)
        UIView.commitAnimations()
    }

    //  MARK: Callback
    private func rotationDegress(orientation: UIInterfaceOrientation) -> CGFloat {
        var degress: CGFloat = 0.0
        if orientation == .landscapeLeft {
            degress = -90.0
        } else if orientation == .landscapeRight {
            degress = 90.0
        } else if orientation == .portraitUpsideDown {
            degress = 180.0
        }
        return degress
    }
}

//  MARK: - RGToastView
fileprivate class RGToastView: UIView {
    private var messageRect: CGRect?
    private var _image: UIImage?
    private var _messageText: String?
    fileprivate var image: UIImage? {
        get {
            return _image
        }
        set {
            _image = newValue
            adjust()
        }
    }
    fileprivate var messageText: String? {
        get {
            return _messageText
        }
        set {
            _messageText = newValue
            adjust()
        }
    }

    fileprivate init() {
        super.init(frame: CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0))
        self.messageRect = bounds.insetBy(dx: 10.0, dy: 10.0)
        self.backgroundColor = UIColor.clear
        self.messageText = ""
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func drawRoundRectangle(in rect: CGRect, radius: CGFloat) {
        let context = UIGraphicsGetCurrentContext()
        let rRect = CGRect(x: rect.origin.x, y: rect.origin.y, width: rect.width, height: rect.height)
        let minX = rRect.minX, midX = rRect.midX, maxX = rRect.maxX
        let minY = rRect.minY, midY = rRect.midY, maxY = rRect.maxY
        context?.move(to: CGPoint(x: minX, y: midY))
        context?.addArc(tangent1End: CGPoint(x: minX, y: minY),
                        tangent2End: CGPoint(x: midX, y: minY),
                        radius: radius)
        context?.addArc(tangent1End: CGPoint(x: maxX, y: minY),
                        tangent2End: CGPoint(x: maxX, y: midY),
                        radius: radius)
        context?.addArc(tangent1End: CGPoint(x: maxX, y: maxY),
                        tangent2End: CGPoint(x: midX, y: maxY),
                        radius: radius)
        context?.addArc(tangent1End: CGPoint(x: minX, y: maxY),
                        tangent2End: CGPoint(x: minX, y: midY),
                        radius: radius)
        context?.closePath()
        context?.drawPath(using: .fill)
    }

    override func draw(_ rect: CGRect) {
        UIColor(white: 0.0, alpha: 0.8).set()
        drawRoundRectangle(in: rect, radius: 10.0)
        UIColor.white.set()

        let paragraphStyle = NSMutableParagraphStyle.default.mutableCopy()
        (paragraphStyle as! NSMutableParagraphStyle).lineBreakMode = .byWordWrapping
        (paragraphStyle as! NSMutableParagraphStyle).alignment = .center
        let dict = [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 14.0),
                    NSAttributedStringKey.paragraphStyle: paragraphStyle,
                    NSAttributedStringKey.foregroundColor: UIColor.white]
        (messageText! as NSString).draw(in: messageRect!, withAttributes: dict)

        if let image = image {
            var imageRect = CGRect.zero
            imageRect.origin.y = 15.0
            imageRect.origin.x = (rect.width - image.size.width) / 2.0
            imageRect.size = image.size
            image.draw(in: imageRect)
        }
    }

    //  MARK: Setter Methods
    private func adjust() {
        let size = messageText?.boundingRect(with: CGSize(width: 160.0, height: 200.0),
                                             options: [.usesLineFragmentOrigin],
                                             attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 14.0)],
                                             context: nil).size
        messageText?.size(withAttributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 14.0)])
        var imageAdjustment: CGFloat = 0.0
        if image != nil {
            imageAdjustment = 7.0 + (image?.size.height)!
        }
        bounds = CGRect(x: 0.0, y: 0.0, width: (size?.width)! + 40.0, height: (size?.height)! + 15.0 + 15.0 + imageAdjustment)
        messageRect?.size = size!
        messageRect?.size.height += 5
        messageRect?.origin.x = 20.0
        messageRect?.origin.y = 15.0 + imageAdjustment
        
        setNeedsLayout()
        setNeedsDisplay()
    }
}

// MARK:
protocol CanBeToast { }
extension UIImage: CanBeToast { }
extension String: CanBeToast { }
