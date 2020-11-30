//
//  Color+RGAppTools.swift
//  RGAppTools
//
//  Created by RAIN on 2020/11/30.
//  Copyright © 2020 Smartech. All rights reserved.
//

import SwiftUI

@available(iOS 13.0, *)
extension Color {

    init(_ colorSpace: Color.RGBColorSpace = .sRGB, hex: Int, opacity: Double = 1.0) {
        let components = (
            R: Double((hex >> 16) & 0xff) / 255,
            G: Double((hex >> 08) & 0xff) / 255,
            B: Double((hex >> 00) & 0xff) / 255
        )
        self.init(
            colorSpace,
            red: components.R,
            green: components.G,
            blue: components.B,
            opacity: opacity
        )
    }

}
