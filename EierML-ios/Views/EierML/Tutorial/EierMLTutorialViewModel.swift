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
            title: "Willkommen",
            text: "Fangen wir ganz am Anfang an, EierML ist eine App die dazu erschaffen 🧠 und trainiert 💪 wurde dir das Eier kochen zu erleichtern. Wische nach nun nach oben um zum nächsten Schritt zu kommen.",
            imageName: nil
        ),
        TutorialSheet(
            title: "Eier hinzufügen",
            text: "Tippe auf das Plus Symbol um ein Ei hinzuzufügen.",
            imageName: "tutorial_add_button"
        ),
        TutorialSheet(
            title: "Ei vermessen",
            text: "Um zu berechnen wie lang dein Ei kochen muss brauchen wir die Maße des Eis.",
            imageName: "tutorial_add_view"
        ),
        TutorialSheet(
            title: "Deine Eier",
            text: "Wenn du ein Ei hinzufügst findest du es dannach in der List \"Deine Eier\" wieder.",
            imageName: "tutorial_list"
        ),
        TutorialSheet(
            title: "Viel Spaß!",
            text: "Wir wünschen dir viel Erfolg beim Eier kochen!\n\nDein EierML-Team",
            imageName: nil,
            doneButton: true
        )
    ]
}
