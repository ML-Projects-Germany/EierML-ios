//
//  EierMLTutorialViewModel.swift
//  EierML-ios
//
//  Created by Torben Köhler on 26.08.21.
//

import Foundation

// swiftlint:disable line_length
class EierMLTutorialViewModel: ObservableObject {
    @Published var tutorialSheets: [TutorialSheet] = [
        TutorialSheet(
            title: "Wilkommen zum EierML-Tutorial",
            text: "Fangen wir ganz am Anfang an, EierML ist eine App die dazu erschaffen 🧠 und trainiert 💪 wurde dir das Eier kochen zu erleichtern.",
            imageName: ""
        )
//        ,
//        TutorialSheet(
//            title: <#T##String#>,
//            text: <#T##String#>,
//            imageName: <#T##String#>
//        )
    ]
}
