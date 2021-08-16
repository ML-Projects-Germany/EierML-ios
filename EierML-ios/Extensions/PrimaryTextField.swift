//
//  PrimaryTextField.swift
//  EierML-ios
//
//  Created by Torben Köhler on 10.07.21.
//

import SwiftUI

struct PrimaryTextField: View {
    var placeholder: String
    var mainColor: Color
    var borderColor: Color
    var imageName: String?
    var systemImage: Bool
    @Binding var text: String

    init(
        _ placeholder: String,
        text: Binding<String>,
        mainColor: Color = .gray,
        borderColor: Color = .green,
        imageName: String? = nil,
        systemImage: Bool = true
    ) {
        self.placeholder = placeholder
        self.mainColor = mainColor
        self.borderColor = borderColor
        self.imageName = imageName
        self.systemImage = systemImage
        self._text = text
    }

    var body: some View {
        HStack {
            if let imageName = imageName, !imageName.isEmpty {
                if systemImage {
                    Image(systemName: imageName)
                        .font(.body.bold())
                        .imageScale(.large)
                        .foregroundColor(mainColor)
                        .frame(width: 20)
                } else {
                    Image(imageName)
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .font(.body.bold())
                        .imageScale(.large)
                        .foregroundColor(mainColor)
                        .frame(width: 20)
                }
            }
            ZStack {
                Text(placeholder)
                    .font(!text.isEmpty ? .footnote : .body)
                    .foregroundColor(mainColor.opacity(0.8))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, !text.isEmpty ? 22 : 0)
                TextField("", text: $text)
                    .foregroundColor(mainColor)
                    .padding(.top, !text.isEmpty ? 14 : 0)
            }
        }
        .frame(height: 50)
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 15)
        .background(RoundedRectangle(cornerRadius: 13).stroke(borderColor, lineWidth: 2))
    }
}

struct PrimaryTextField_Preview: View {
    @State var text: String = ""

    var body: some View {
        VStack(spacing: 25) {
            PrimaryTextField("Placeholder", text: $text, imageName: "arrow.up.and.down")
            PrimaryTextField("Placeholder", text: $text, imageName: "")
            PrimaryTextField(
                "Egg",
                text: $text,
                imageName: "egg",
                systemImage: false
            )
        }
        .padding()
    }
}

struct PrimaryTextField_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryTextField_Preview()
    }
}
