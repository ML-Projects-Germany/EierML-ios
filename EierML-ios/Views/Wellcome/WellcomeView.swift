//
//  WellcomeView.swift
//  EierML-ios
//
//  Created by Torben Köhler on 05.07.21.
//

import SwiftUI

struct WellcomeView: View {
    @AppStorage("firstAppStart") var firstAppStart: Bool?

    var body: some View {
        NavigationView {
            ZStack {
                ClassicBackgroundView()
                    .ignoresSafeArea()
                VStack(alignment: .leading) {
                    Text("Wilkommen")
                        .bold()
                    Text("zu unserem Projekt EierML")
                }
                .font(.largeTitle)
                VStack(alignment: .leading) {
                    Spacer()
                    Button(action: {
                        withAnimation {
                            firstAppStart = false
                        }
                    }, label: {
                        Text("Weiter")
                    })
                    .buttonStyle(PrimaryButtonStyle(color: Color.Palette.red))
                    .padding()
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct WellcomePageView_Previews: PreviewProvider {
    static var previews: some View {
        WellcomeView()
    }
}
