//
//  PixelConverter.swift
//  EierML-ios
//
//  Created by Torben Köhler on 05.09.21.
//

import Foundation
import UIKit

class PixelConverter {
    static func checkThatDeviceIsSupported() -> Bool {
        return UIScreen.pixelsPerCentimeter != nil
    }

    static func getCentimeterForNormalPixels(_ pixels: CGFloat) -> CGFloat {
        let nativeBoundsComposer = UIScreen.main.nativeBounds.width/UIScreen.main.bounds.width
        let nativeBounds = pixels*nativeBoundsComposer

        return nativeBounds/(UIScreen.pixelsPerCentimeter ?? 1)
    }
    static func getNormalPixelsForCentimeter(_ centimeter: CGFloat) -> CGFloat {
        let nativeBounds = centimeter*(UIScreen.pixelsPerCentimeter ?? 1)
        let nativeBoundsComposer = UIScreen.main.nativeBounds.width/UIScreen.main.bounds.width

        return nativeBounds/nativeBoundsComposer
    }
}
