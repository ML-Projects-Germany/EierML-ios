//
//  View+eModifier.swift
//  EierML-ios
//
//  Created by Torben Köhler on 15.09.21.
//

import SwiftUI

extension View {
    // swiftlint:disable:next function_parameter_count
    func alertView(
        title: String,
        description: String,
        primaryButtonTitle: String,
        secondaryButtonTitle: String,
        show: Binding<Bool>,
        action: @escaping () -> Void
    ) -> some View {
        let model = AlertViewModel(
            title: title,
            description: description,
            buttonTitle: primaryButtonTitle
        )
        return modifier(AlertViewModifier(model: model, action: action, shown: show))
    }
}
