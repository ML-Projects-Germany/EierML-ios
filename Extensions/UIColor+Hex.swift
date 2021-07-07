//
//  UIColor+Hex.swift
//  SamedayTesting-ios
//
//  Created by Marius Seufzer on 04.02.21.
//

import UIKit

extension UIColor {
    /// Creates an UIColor from HEX String in "#363636" format. (Doesn't matter if # is included or not)
    /// - Parameter hex: HEX String in "#363636" format
    convenience init(hex: String) {
        var cString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if cString.hasPrefix("#") {
            cString.remove(at: cString.startIndex)
        }

        if cString.count != 6 {
            self.init(.gray)
        }

        var rgbValue: UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        self.init(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
