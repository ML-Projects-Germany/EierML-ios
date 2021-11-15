//
//  EierMLTutorialViewModel.swift
//  EierML-ios
//
//  Created by Torben Köhler on 26.08.21.
//

import Foundation

class EierMLTutorialViewModel: ObservableObject {
    @Published var tutorialSheets: [TutorialSheet] = []

    func loadSheets() {
        if let url = Bundle.main.url(forResource: "TutorialSheets.json", withExtension: nil) {
            if let data = try? Data(contentsOf: url) {
                let jsondecoder = JSONDecoder()
                do {
                    let result = try jsondecoder.decode([TutorialSheet].self, from: data)
                    self.tutorialSheets = result
                } catch { print(error) }
            }
        }
    }
}
