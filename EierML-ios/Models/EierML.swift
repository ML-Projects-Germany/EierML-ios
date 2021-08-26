//
//  EierML.swift
//  EierML-ios
//
//  Created by Torben Köhler on 26.08.21.
//

import Foundation
class EierML {
    static func predict_v1(
        height: Int,
        width: Int,
        viscosity: Int
    ) -> Int {
        var result = Double(height)*(-21.99032108)
        result += Double(width)*80.18921518
        result += Double(viscosity)*34.69196907
        result += -150.79408648
        return Int(result.rounded())
    }
}
