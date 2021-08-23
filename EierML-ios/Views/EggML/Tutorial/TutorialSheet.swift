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
    var weiterAnimation: Bool
    var skipButton: Bool

    init(
        title: String,
        text: String,
        imageName: String,
        weiterAnimation: Bool = false,
        skipButton: Bool = false
    ) {
        self.title = title
        self.text = text
        self.imageName = imageName
        self.weiterAnimation = weiterAnimation
        self.skipButton = skipButton
    }

    static var mock: Self {
        .init(title: "Hello", text: "Some Text", imageName: "", weiterAnimation: true)
    }
}
