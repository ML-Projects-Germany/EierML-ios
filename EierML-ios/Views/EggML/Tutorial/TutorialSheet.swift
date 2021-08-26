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
    var imageName: String?
    var doneButton: Bool

    init(
        title: String,
        text: String,
        imageName: String?,
        doneButton: Bool = false
    ) {
        self.title = title
        self.text = text
        self.imageName = imageName
        self.doneButton = doneButton
    }

    static var mock: Self {
        .init(title: "Hello", text: "Some Text", imageName: nil)
    }
}
