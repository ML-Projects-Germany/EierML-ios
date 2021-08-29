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
}
