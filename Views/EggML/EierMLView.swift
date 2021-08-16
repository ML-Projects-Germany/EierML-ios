//
//  EierMLView.swift
//  EierML-ios
//
//  Created by Torben Köhler on 12.08.21.
//

import SwiftUI

struct EierMLView: View {
    @State var tap: Bool = true

    var body: some View {
        ZStack {
            ClassicBackgroundView()
                .ignoresSafeArea()
            ZStack {
                if tap {
                    EierMLTutorialView()
                        .transition(.move(edge: .leading))
                        .zIndex(1.0)
                } else {
                    EggListView()
                        .transition(.move(edge: .leading))
                        .blur(radius: tap ? 3 : 0)
                }
            }
            .animation(.easeInOut)
//            Button(action: { tap.toggle() }, label: {
//                Text("Button")
//                    .foregroundColor(.white)
//                    .padding()
//                    .background(Color.blue.opacity(0.8))
//                    .cornerRadius(20)
//            })
        }
    }
}

struct EggMLView_Previews: PreviewProvider {
    static var previews: some View {
        EierMLView()
    }
}
