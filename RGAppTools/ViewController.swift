//
//  ViewController.swift
//  RGAppTools
//
//  Created by RAIN on 16/2/2.
//  Copyright © 2016-2017 Smartech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction private func deviceInfoButtonCLick(_ sender: UIButton) {
        UIDevice.rat.printDeviceInformations()
        print("screen.size: ", MainScreen.size)
        print("screen.scale: ", MainScreen.scale)
        print("pixel width: ", MainScreen.pixelWidth)
        print("pixel height: ", MainScreen.pixelHeight)

        print("Device.type: ", UIDevice.rat.deviceType)
        print("Device.type.rawValue: ", UIDevice.rat.deviceType.rawValue)
        print("Device.typeValue: ", UIDevice.rat.deviceTypeValue)
    }

    @IBAction private func clearNilButtonClick(_ sender: UIButton) {
        print(String.rat.clearNil(and: "", for: "abb"))
        print(String.rat.clearNil(and: "abb", "a", for: "abb"))
        print(String.rat.clearNil(and: "NaN", "null", for: "abb"))

        print(String.rat.clearNil(and: [], for: "abb"))
        print(String.rat.clearNil(for: "abb"))
        print(String.rat.clearNil(and: ["a", "abb"], for: "abb"))
        print(String.rat.clearNil(and: ["a", "b"], for: "abb"))

        print(" ".rat.or("default"))
        print("not default".rat.or("default"))
    }

    private func aboutString() {
        var str = "01234"
        str.rat_insert("5", at: 5)
        print(str)
        print(str.rat_isBlank)
        let r = str.rat_remove(at: 6)
        print(str, r ?? "nil")
        str.rat_replace(subrange: 0 ..< 1, with: "1")
        print(str)

        let s: String? = nil
        print(s.rat_isBlank)
        print(s.rat_isNone)

        let dic = ["key": "value"]

        should {
            let data = try JSONSerialization.data(withJSONObject: dic, options: JSONSerialization.WritingOptions.prettyPrinted)
            print(data)
            }.rat_or{ print($0) }

        let i: Int? = 9
        print(i.rat_isNone)
    }

}

