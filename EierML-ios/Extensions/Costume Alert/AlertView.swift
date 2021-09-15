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
                buttonTitle: "Log out"
            ),
            action: {},
            closeTriggered: {}
        )
    }
}
