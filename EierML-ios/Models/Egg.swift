//
//  Egg.swift
//  EierML-ios
//
//  Created by Torben Köhler on 12.08.21.
//

import Foundation

struct Egg: Identifiable, Codable {
    let id: UUID
    var number: Int
    var height: Int
    var width: Int
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
        self.time = EierML.predict_v2_1(
            height: height,
            width: width,
            viscosity: viscosity
        )
    }
    var timeString: String {
        let minutes = Int(time/60)
        let seconds = Int(time%60)

        return "\(minutes)min \(seconds)s"
    }
    static var mock: Self {
        let height = Int.random(in: 44...65)
        let width = Int.random(in: 40...45)
        let viscosity = Int.random(in: 1...10)
        return Egg(
            number: 1,
            height: height,
            width: width,
            viscosity: viscosity,
            time: EierML.predict_v2_1(
                height: height,
                width: width,
                viscosity: viscosity
            )
        )
    }
    static func generateMocks(_ number: Int) -> [Self] {
        var eggs: [Egg] = []

        if number > 0 {
            for i in 0...number-1 {
                let number = i+1
                let height = Int.random(in: 44...65)
                let width = Int.random(in: 40...45)
                let viscosity = Int.random(in: 1...10)
                eggs.append(Egg(
                    number: number,
                    height: height,
                    width: width,
                    viscosity: viscosity,
                    time: EierML.predict_v2_1(
                        height: height,
                        width: width,
                        viscosity: viscosity
                    )
                ))
            }
        }
        return eggs
    }
}
