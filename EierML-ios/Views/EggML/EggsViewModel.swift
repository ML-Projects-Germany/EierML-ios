//
//  EggsViewModel.swift
//  EierML-ios
//
//  Created by Torben Köhler on 12.08.21.
//

import SwiftUI
import Combine

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

    var showEditEggView: PassthroughSubject<Egg, Never> = .init()

    init() {
        eggTutorialIsShown = UserDefaults.standard.bool(forKey: "eggTutorialIsShown")
        print(eggTutorialIsShown)
    }

    func refreshEggs() {
        var eggsWithNewNumbers: [Egg] = []
        var number = 1
        for egg in eggs {
            var newEgg = egg
            newEgg.number = number
            number += 1
            eggsWithNewNumbers.append(newEgg)
        }
        eggs = eggsWithNewNumbers
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
