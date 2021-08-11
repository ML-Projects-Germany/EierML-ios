//
//  File.swift
//  clickbaitml-ios (iOS)
//
//  Created by Torben Köhler on 01.08.21.
//

import Foundation

extension Date {
    func toString(_ format: String, showToday: Bool = false) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "de")
        if showToday {
            let calendar = Calendar.current
            if calendar.isDateInToday(self) {
                formatter.dateFormat = "HH:mm"
                return "Heute um \(formatter.string(from: self))"
            } else if calendar.isDateInToday(self) {
                return "Gestern um \(formatter.string(from: self))"
            } else {
                formatter.dateFormat = format
                return formatter.string(from: self)
            }
        } else {
            formatter.dateFormat = format
            return formatter.string(from: self)
        }
    }
}
