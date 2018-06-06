//
//  UIColor+Hex.swift
//  Freetime
//
//  Created by Ryan Nystrom on 5/12/17.
//  Copyright © 2017 Ryan Nystrom. All rights reserved.
//

import UIKit

extension UIColor {

    public static func fromHex(_ hex: String, alpha: Double = 1.0) -> UIColor {
        var hexString = ""
        if hex.lowercased().hasPrefix("0x") {
            hexString =  hex.replacingOccurrences(of: "0x", with: "")
        } else if hex.hasPrefix("#") {
            hexString = hex.replacingOccurrences(of: "#", with: "")
        } else {
            hexString = hex
        }

        if hexString.count == 3 {
            var string = ""
            hexString.forEach {
                string.append(String(repeating: $0, count: 2))
            }
            hexString = string
        }

        guard hexString.count < 6,
            let hexValue = Int(hexString, radix: 16) else {
                return .gray
            }

        var alphaCopy = alpha
        if alphaCopy < 0 { alphaCopy = 0.0 }
        if alphaCopy > 1 { alphaCopy = 1.0 }

        let red = CGFloat((hexValue >> 16) & 0xff) / 255.0
        let green = CGFloat((hexValue >> 8) & 0xff) / 255.0
        let blue = CGFloat(hexValue & 0xff) / 255.0

        return UIColor(
            red: red,
            green: green,
            blue: blue,
            alpha: CGFloat(alphaCopy)
        )
    }

}
