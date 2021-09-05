//
//  WellcomeMessageView.swift
//  EierML-ios
//
//  Created by Torben Köhler on 19.07.21.
//

import SwiftUI

struct WellcomeMessageView: View {
    @Environment(\.colorScheme) var colorScheme

    @Binding private var isShown: Bool

    init(isShown: Binding<Bool>) {
        self._isShown = isShown
    }

    var body: some View {
        // swiftlint:disable:next line_length
        Text("Wilkommen zur EierML-App!\nWir freuen uns sehr das du unsere App nutzt und wünschen dir viel Spaß beim Entdecken!")
            .lineLimit(20)
            .multilineTextAlignment(.leading)
            .frame(maxWidth: .infinity, minHeight: 70, alignment: .leading)
            .padding(15)
            .padding(.trailing, 15)
            .background(
                Color.primary.colorInvert()
                    .opacity(0.2)
            )
            .overlay(
                ZStack {
                    Button(action: {
                        withAnimation {
                            isShown = false
                        }
                    }, label: {
                        Image(systemName: "xmark.circle.fill")
                            .imageScale(.large)
                            .font(.body.bold())
                            .foregroundColor(.white)
                    })
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                .padding(10)
            )
            .cornerRadius(15)
    }

}

struct WellcomeMessageView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            ClassicBackgroundView()
                .ignoresSafeArea()
            WellcomeMessageView(isShown: .constant(true))
        }
        .previewDevice("iPod touch (7th generation)")
    }
}
