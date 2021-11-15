//
//  EierML.swift
//  EierML-ios
//
//  Created by Torben Köhler on 26.08.21.
//

import Foundation
class EierML {
    /// EierML Predict
    ///
    /// - Parameters:
    ///   - height: In mm
    ///   - width: In mm
    ///   - viscosity: Int between 1 and 10
    // swiftlint:disable:next function_parameter_count
    static private func predict(
        height: Int,
        width: Int,
        viscosity: Int,
        heightValue: Double,
        widthValue: Double,
        viscosityValue: Double,
        intercept: Double
    ) -> Int {
        var result = (Double(height)/10)*(heightValue)
        result += (Double(width)/10)*widthValue
        result += Double(viscosity)*viscosityValue
        result += intercept
        return Int(result.rounded())
    }
}

// MARK: MLs
extension EierML {
    // MARK: Version 1.0
    /// EierML Predict Version 1.0 (30 Eggs) - inaccuracy: 32 sec
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
        self.predict(
            height: height,
            width: width,
            viscosity: viscosity,
            heightValue: -21.99032108,
            widthValue: 80.18921518,
            viscosityValue: 34.69196907,
            intercept: -150.79408648
        )
    }
    // MARK: Version 1.1
    /// EierML Predict Version 1.1 (30 Eggs, Random) - inaccuracy: 30sec
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
        self.predict(
            height: height,
            width: width,
            viscosity: viscosity,
            heightValue: 29.5322432,
            widthValue: 6.28046511,
            viscosityValue: 35.3947141,
            intercept: -126.47845921
        )
    }
    // MARK: Version 2.0
    /// EierML Predict Version 2.0 (55 Eggs) - inaccuracy: 29 sec
    ///
    /// - Parameters:
    ///   - height: In mm
    ///   - width: In mm
    ///   - viscosity: Int between 1 and 10
    static func predict_v2(
        height: Int,
        width: Int,
        viscosity: Int
    ) -> Int {
        self.predict(
            height: height,
            width: width,
            viscosity: viscosity,
            heightValue: 0.56663107,
            widthValue: 47.66032689,
            viscosityValue: 33.37282513,
            intercept: -123.23978677
        )
    }
    // MARK: Version 2.1
    /// EierML Predict Version 2.1 (55 Eggs, Random) - inaccuracy: 29 sec
    ///
    /// - Parameters:
    ///   - height: In mm
    ///   - width: In mm
    ///   - viscosity: Int between 1 and 10
    static func predict_v2_1(
        height: Int,
        width: Int,
        viscosity: Int
    ) -> Int {
        self.predict(
            height: height,
            width: width,
            viscosity: viscosity,
            heightValue: 4.61837186,
            widthValue: 28.92121981,
            viscosityValue: 32.95068491,
            intercept: -64.80350936
        )
    }
}
