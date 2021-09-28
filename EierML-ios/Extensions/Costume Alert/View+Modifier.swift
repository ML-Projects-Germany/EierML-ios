//
//  View+eModifier.swift
//  EierML-ios
//
//  Created by Torben Köhler on 15.09.21.
//

import SwiftUI

extension View {
    func alertView(
        title: String,
        description: String,
        primaryButtonTitle: String,
        show: Binding<Bool>,
        action: @escaping () -> Void
    ) -> some View {
        let model = AlertViewModel(
            title: title,
            description: description,
            primaryButtonTitle: primaryButtonTitle
        )
        return modifier(AlertViewModifier(model: model, action: action, shown: show))
    }
}
