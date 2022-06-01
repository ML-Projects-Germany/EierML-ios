//
//  Egg+mock.swift
//  EierML-ios
//
//  Created by Torben Köhler on 01.06.22.
//

import Foundation

extension Egg {
    static var mock: Self {
        let height = Int.random(in: 44...65)
        let width = Int.random(in: 40...45)
        let viscosity = Int.random(in: 1...10)
        return Egg(
            number: 1,
            height: height,
            width: width,
            viscosity: viscosity,
            time: MLEngine.predict_v2_1(
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
                    time: MLEngine.predict_v2_1(
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
