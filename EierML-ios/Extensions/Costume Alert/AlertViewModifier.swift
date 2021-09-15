//
//  AlertViewModifier.swift
//  EierML-ios
//
//  Created by Torben Köhler on 15.09.21.
//

import SwiftUI

struct AlertViewModifier: ViewModifier {
    let model: AlertViewModel
    var action: () -> Void
    @Binding var shown: Bool

    func body(content: Content) -> some View {
        ZStack {
            content

            if shown {
                AlertView(model: model, action: {
                    shown = false
                    action()
                }, closeTriggered: { shown = false })
                .frame(alignment: .center)
                .transition(
                    .scale(scale: 0.85)
                        .combined(with: .opacity)
                        .animation(.easeIn(duration: 0.16))
                )
                .zIndex(1.0)
            }
        }
    }
}
