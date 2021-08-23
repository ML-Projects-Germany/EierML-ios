//
//  Egg.swift
//  EierML-ios
//
//  Created by Torben Köhler on 12.08.21.
//

import Foundation

struct Egg: Identifiable {
    let id: UUID = UUID()
    var number: Int
    var size: Int
    var time: Int

    var timeInMinutes: String {
        if time.isMultiple(of: 60) {
            return "\(time/60)"
        } else {
            return String(format: "%.1f", Double(time)/60)
        }
    }

    static var mock: Self {
        .init(number: 1, size: 43, time: 180)
    }
}
