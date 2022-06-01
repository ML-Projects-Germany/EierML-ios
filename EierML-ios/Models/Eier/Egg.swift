//
//  Egg.swift
//  EierML-ios
//
//  Created by Torben Köhler on 12.08.21.
//

import Foundation

struct Egg: Identifiable, Equatable, Codable {
    let id: UUID
    var number: Int
    /// in milimeters
    var height: Int
    /// in milimeters
    var width: Int
    /// between 1 to 10
    var viscosity: Int
    var time: Int
    // MARK: init without ML
    init(
        number: Int,
        height: Int,
        width: Int,
        viscosity: Int,
        time: Int
    ) {
        self.id = UUID()
        self.number = number
        self.height = height
        self.width = width
        self.viscosity = viscosity
        self.time = time
    }
    // MARK: init with ML
    init(
        number: Int,
        height: Int,
        width: Int,
        viscosity: Int
    ) {
        self.id = UUID()
        self.number = number
        self.height = height
        self.width = width
        self.viscosity = viscosity
        self.time = MLEngine.predict_v2_1(
            height: height,
            width: width,
            viscosity: viscosity
        )
    }
}

extension Egg {
    var timeString: String {
        let minutes = Int(time/60)
        let seconds = Int(time%60)

        return "\(minutes)min \(seconds)s"
    }
}
