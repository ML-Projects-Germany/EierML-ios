//
//  EierML_iosApp.swift
//  EierML-ios
//
//  Created by Torben Köhler on 05.07.21.
//

import SwiftUI
import ComposableArchitecture

@main
struct EierML_iosApp: App {
    var body: some Scene {
        WindowGroup {
            ZStack {
                AppBackground()
                EggSizeView(store: Store(
                    initialState: .init(
                        heightSliderValue: 0.5,
                        widthSliderValue: 0.5
                    ),
                    reducer: eggSizeViewReducer,
                    environment: ()
                ))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
            }
        }
    }
}
