//
//  EierML.swift
//  EierML-ios
//
//  Created by Torben Köhler on 26.08.21.
//

import Foundation
class EierML {
    /// EierML Predict Version 1 (30 Eggs)
    ///
    /// - Parameters:
    ///   - height: In mm
    ///   - width: In mm
    ///   - viscosity: Int between 1 and 10
    static private func predict(
        height: Int,
        width: Int,
        viscosity: Int,
        heightValue: Double,
        widthValue: Double,
        viscosityValue: Double,
        intercept: Double
    ) -> Int {
        var result = (Double(height)/10)*(-21.99032108)
        result += (Double(width)/10)*80.18921518
        result += Double(viscosity)*34.69196907
        result += -150.79408648
        return Int(result.rounded())
    }
}

// MARK: MLs
extension EierML {
    // MARK: Version 1
    /// EierML Predict Version 1 (30 Eggs)
    ///
    /// - Parameters:
    ///   - height: In mm
    ///   - width: In mm
    ///   - viscosity: Int between 1 and 10
    static func predict_v1(
        height: Int,
        width: Int,
        viscosity: Int
    ) -> Int {
        var result = (Double(height)/10)*(-21.99032108)
        result += (Double(width)/10)*80.18921518
        result += Double(viscosity)*34.69196907
        result += -150.79408648
        return Int(result.rounded())
    }
    // MARK: Version 1.1
    /// EierML Predict Version 1 (30 Eggs)
    ///
    /// - Parameters:
    ///   - height: In mm
    ///   - width: In mm
    ///   - viscosity: Int between 1 and 10
    static func predict_v1_1(
        height: Int,
        width: Int,
        viscosity: Int
    ) -> Int {
        var result = (Double(height)/10)*(-21.99032108)
        result += (Double(width)/10)*80.18921518
        result += Double(viscosity)*34.69196907
        result += -150.79408648
        return Int(result.rounded())
    }

}

//[[29.5322432, 6.28046511, 35.3947141 ]]
//[-126.47845921]
//
//[[ 0.56663107, 47.66032689, 33.37282513]]
//[-123.23978677]
//
//[[ 4.61837186, 28.92121981, 32.95068491]]
//[-64.80350936]
