//
//  Egg.swift
//  EierML-ios
//
//  Created by Torben Köhler on 12.08.21.
//

import Foundation

struct Egg: Identifiable {
    let id: UUID = UUID()
    let number: Int
    var height: Int
    var width: Int
    var time: Int

    var timeInMinutes: String {
        if time.isMultiple(of: 60) {
            return "\(time/60)"
        } else {
            return String(format: "%.1f", Double(time)/60)
        }
    }

    static var mock: Self {
        .init(
            number: 1,
            height: Int.random(in: 44...65),
            width: Int.random(in: 40...45),
            time: 180
        )
    }
}
