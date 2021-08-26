//
//  Egg.swift
//  EierML-ios
//
//  Created by Torben Köhler on 12.08.21.
//

import Foundation

struct Egg: Identifiable, Codable {
    let id: UUID
    let number: Int
    var height: Int
    var width: Int
    var time: Int
    init(
        number: Int,
        height: Int,
        width: Int,
        time: Int
    ) {
        self.id = UUID()
        self.number = number
        self.height = height
        self.width = width
        self.time = time
    }
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
