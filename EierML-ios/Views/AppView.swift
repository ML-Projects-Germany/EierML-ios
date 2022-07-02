//
//  AppView.swift
//  EierML-ios
//
//  Created by Torben Köhler on 05.07.21.
//

import SwiftUI
import ComposableArchitecture

struct AppView: View {
    var store: Store<AppState, AppAction>

    var body: some View {
        WithViewStore(self.store) { viewStore in
            ZStack {
                AppBackground()
                MainView(store: Store(
                    initialState: .init(eggs: []),
                    reducer: mainViewReducer,
                    environment: ()
                ))
            }
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView(store: .init(
            initialState: .init(),
            reducer: appReducer,
            environment: ()
        ))
        AppView(store: .init(
            initialState: .init(),
            reducer: appReducer,
            environment: ()
        ))
        .previewDevice("iPod touch (7th generation)")
        .preferredColorScheme(.dark)
    }
}
