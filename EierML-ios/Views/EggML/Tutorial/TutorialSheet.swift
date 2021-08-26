//
//  TutorialSheet.swift
//  EierML-ios
//
//  Created by Torben Köhler on 16.08.21.
//

import Foundation

struct TutorialSheet: Identifiable, Equatable {
    let id: UUID = UUID()
    var title: String
    var text: String
    var imageName: String
    var fertigButton: Bool

    init(
        title: String,
        text: String,
        imageName: String,
        fertigButton: Bool = false
    ) {
        self.title = title
        self.text = text
        self.imageName = imageName
        self.fertigButton = fertigButton
    }

    static var mock: Self {
        .init(title: "Hello", text: "Some Text", imageName: "", fertigButton: false)
    }
}
