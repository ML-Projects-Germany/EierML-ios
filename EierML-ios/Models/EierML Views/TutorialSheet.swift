//
//  TutorialSheet.swift
//  EierML-ios
//
//  Created by Torben Köhler on 16.08.21.
//

import Foundation

struct TutorialSheet: Identifiable, Equatable {
    private(set) var id: UUID = UUID()
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
}

extension TutorialSheet: Decodable {
    enum CodingKeys: CodingKey {
        case title, text, imageName, doneButton
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decode(String.self, forKey: .title)
        self.text = try container.decode(String.self, forKey: .text)
        self.imageName = try? container.decode(String.self, forKey: .imageName)
        self.doneButton = (try? container.decode(Bool.self, forKey: .doneButton)) ?? false
    }
}
