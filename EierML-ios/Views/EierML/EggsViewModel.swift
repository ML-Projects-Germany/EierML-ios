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
            if !eggTutorialIsShown {
                UserDefaults.standard.setValue(true, forKey: "eggTutorialWasShown")
            }
        }
    }

    @Published var addEggViewIsPresented: Bool = false
    @Published var editableEgg: Egg?
    private var cancellables: Set<AnyCancellable> = []

    init() {
        eggTutorialIsShown = !UserDefaults.standard.bool(forKey: "eggTutorialWasShown")
        print(eggTutorialIsShown)
    }

    func addEgg(_ egg: Egg) {
        if eggs.contains(where: { $0.number == egg.number }) {
            var editEggNumber: Int = 0
            eggs.forEach({ if $0.number == egg.number { editEggNumber = egg.number }})
            eggs[editEggNumber-1] = egg
        } else {
            eggs.append(egg)
        }
    }

    func deleteEgg(number: Int) {
        eggs.removeAll { $0.number == number }
        refreshEggs()
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

    func showAddEggView(with egg: Egg? = nil) {
        editableEgg = egg
        print(editableEgg?.number)
        addEggViewIsPresented = true
    }

    func dismissAddEggView() {
        addEggViewIsPresented = false
        editableEgg = nil
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
