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
            AppView(store: Store(
                initialState: .init(),
                reducer: appReducer,
				environment: ()
            ))
        }
    }
}
