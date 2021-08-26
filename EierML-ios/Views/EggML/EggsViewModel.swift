//
//  EggsViewModel.swift
//  EierML-ios
//
//  Created by Torben Köhler on 12.08.21.
//

import SwiftUI

class EggsViewModel: ObservableObject {
    @AppStorage("eggs") var eggs: [Egg] = []

    @Published var eggTutorialIsShown: Bool {
        didSet {
            if eggTutorialIsShown {
                UserDefaults.standard.setValue(true, forKey: "eggTutorialIsShown")
                print("Set")
            }
        }
    }

    init() {
        eggTutorialIsShown = UserDefaults.standard.bool(forKey: "eggTutorialIsShown")
        print(eggTutorialIsShown)
    }
}

extension Array: RawRepresentable where Element: Codable {
    public init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8),
              let result = try? JSONDecoder().decode([Element].self, from: data)
        else {
            return nil
        }
        self = result
    }

    public var rawValue: String {
        guard let data = try? JSONEncoder().encode(self),
              let result = String(data: data, encoding: .utf8)
        else {
            return "[]"
        }
        return result
    }
}
