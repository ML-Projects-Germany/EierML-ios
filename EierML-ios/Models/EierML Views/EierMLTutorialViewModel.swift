//
//  EierMLTutorialViewModel.swift
//  EierML-ios
//
//  Created by Torben Köhler on 26.08.21.
//

import Foundation

// swiftlint:disable line_length
class EierMLTutorialViewModel: ObservableObject {
    @Published var tutorialSheets: [TutorialSheet] = []

    func loadSheets() {
        if let url = Bundle.main.url(forResource: "TutorialSheets.json", withExtension: nil) {
            if let data = try? Data(contentsOf: url){
                let jsondecoder = JSONDecoder()
                do{
                    let result = try jsondecoder.decode([TutorialSheet].self, from: data)
                    self.tutorialSheets = result
                } catch { print(error) }
            }
        }
    }
}

//[
//    TutorialSheet(
//        title: "Willkommen",
//        text: "Fangen wir ganz am Anfang an, EierML ist eine App die dazu erschaffen 🧠 und trainiert 💪 wurde dir das Eier kochen zu erleichtern. Wische nach nun nach oben um zum nächsten Schritt zu kommen.",
//        imageName: nil
//    ),
//    TutorialSheet(
//        title: "Eier hinzufügen",
//        text: "Tippe auf das Plus Symbol um ein Ei hinzuzufügen.",
//        imageName: "tutorial_add_button"
//    ),
//    TutorialSheet(
//        title: "Ei vermessen",
//        text: "Um zu berechnen wie lang dein Ei kochen muss, brauchen wir die Maße deines Eis.",
//        imageName: "tutorial_add_view"
//    ),
//    TutorialSheet(
//        title: "Größe abmessen",
//        text: "Die Schablone die angezeigt wird, bildet die Größe eines Eis akkurat ab. Du brauchst also nur die App und kein extra Massband 😉.",
//        imageName: nil
//    ),
//    TutorialSheet(
//        title: "Ei härte auswählen",
//        text: "Wähle einfach aus wie hart dein Ei werden soll.",
//        imageName: "tutorial_select_view"
//    ),
//    TutorialSheet(
//        title: "Deine Eier",
//        text: "Wenn du ein Ei hinzufügst findest du es dannach in der List \"Deine Eier\" wieder.",
//        imageName: "tutorial_list"
//    ),
//    TutorialSheet(
//        title: "Wasser aufsetzen",
//        text: "Bevor du deine Eier kochst stelle sicher, dass das Wasser schon kocht. Wir haben bei unseren Messungen die Eier in kochendes Wasser gelegt.",
//        imageName: nil
//    ),
//    TutorialSheet(
//        title: "Kein Kühlschrank",
//        text: "Stelle sicher, dass das dein Ei raumtemperatur hat, lege es dafür zum Beispiel vor dem kochen neben den Topf und lasse es ca. 5min warm werden.",
//        imageName: nil
//    ),
//    TutorialSheet(
//        title: "Timer starten",
//        text: "Wenn du deine Ei hinzugefügt hast tippe einfach auf \"Timer\".",
//        imageName: "tutorial_timer_button"
//    ),
//    TutorialSheet(
//        title: "Hergehört!",
//        text: "Bitte stelle sicher das der Ton deines Handys an und der Timer angezeigt wird, um den Ring Ton zu hören. Wenn dein Handy stumm geschaltet ist wird nur eine Vibration abgespielt die eventuell nicht von allen Nutzern gehört wird!",
//        imageName: nil
//    ),
//    TutorialSheet(
//        title: "Viel Spaß!",
//        text: "Wir wünschen dir viel Erfolg beim Eier kochen!\n\nDein EierML-Team",
//        imageName: nil,
//        doneButton: true
//    )
//]
