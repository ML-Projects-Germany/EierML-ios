//
//  MainView.swift
//  EierML-ios
//
//  Created by Torben Köhler on 02.07.22.
//

import SwiftUI
import ComposableArchitecture

struct MainViewStore: Equatable {
    var eggs: [Egg]
}

enum MainViewAction: Equatable {
    case addEgg(Egg)
}

let mainViewReducer = Reducer<MainViewStore, MainViewAction, Void> { state, action, _ in
    switch action {
    case .addEgg(let egg):
        state.eggs.append(egg)
        return .none
    }
}

struct MainView: View {
    var store: Store<MainViewStore, MainViewAction>

    var body: some View {
        GeometryReader { geometry in
            WithViewStore(self.store) { viewStore in
                VStack {
                    TopNavigationView()
                    EggSizeView(store: Store(
                        initialState: .init(heightSliderValue: 0.5, widthSliderValue: 0.5),
                        reducer: eggSizeViewReducer,
                        environment: ()
                    ))
                    .frame(height: geometry.size.height/2)
                    .frame(maxWidth: 400, maxHeight: .infinity)
                    Spacer()
                        .frame(height: 130)
                }
                .padding()
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
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
