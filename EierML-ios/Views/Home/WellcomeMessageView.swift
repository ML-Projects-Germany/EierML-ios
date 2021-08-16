//
//  WellcomeMessageView.swift
//  EierML-ios
//
//  Created by Torben Köhler on 19.07.21.
//

import SwiftUI

struct WellcomeMessageView: View {
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        ZStack {
            Text("Wilkommen zur EierML-App, wir freuen uns sehr das du unsere App nutzt und wünschen dir viel Spaß beim Entdecken!")
                .multilineTextAlignment(.leading)
                .padding(15)
                .padding(.trailing, 25)
            Button(action: {

            }, label: {
                Image(systemName: "xmark.circle.fill")
                    .imageScale(.large)
                    .font(.body.bold())
                    .foregroundColor(.white)
            })
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            .padding(10)
        }
        .frame(maxWidth: .infinity, maxHeight: 120)
        .background(
            contentBackgroundColor
                .opacity(0.2)
        )
        .cornerRadius(15)
    }

    var contentBackgroundColor: Color {
        colorScheme == .dark ? .black : .white
    }
}

struct WellcomeMessageView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            ClassicBackgroundView()
                .ignoresSafeArea()
            WellcomeMessageView()
        }
        .previewDevice("iPod touch (7th generation)")
    }
}
