//
//  AlertView.swift
//  EierML-ios
//
//  Created by Torben Köhler on 15.09.21.
//

import SwiftUI

struct AlertView: View {
    let model: AlertViewModel
    var action: () -> Void
    let closeTriggered: () -> Void

    var body: some View {
        GeometryReader { reader in
            ZStack {
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        content
                            .padding(.horizontal, 20)
                        Spacer()
                    }

                    Spacer()
                }
                .frame(width: reader.size.width/3*2, height: reader.size.width/3*2, alignment: .center)
                .shadow(radius: 10)
            }
        }

    }

    @ViewBuilder
    private var content: some View {
        Text("")
    }
}

struct AlertView_Previews: PreviewProvider {
    static var previews: some View {
        AlertView(
            model: AlertViewModel(
                title: "Log out?",
                description:
                    "You are about to log out of your Sameday Health account.\n\nPlease confirm you wish to log out.",
                primaryButtonTitle: "Log out"
            ),
            action: {},
            closeTriggered: {}
        )
    }
}
