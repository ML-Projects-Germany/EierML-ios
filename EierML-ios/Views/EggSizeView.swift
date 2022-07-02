//
//  EggSizeView.swift
//  EierML-ios
//
//  Created by Torben Köhler on 01.06.22.
//

import SwiftUI
import ComposableArchitecture

struct EggSizeViewState: Equatable {
    var heightSliderValue: Double
    var widthSliderValue: Double
}

enum EggSizeViewAction {
    case updateHeightSliderValue(Double)
    case updateWidthSliderValue(Double)
}

var eggSizeViewReducer = Reducer<EggSizeViewState, EggSizeViewAction, Void> { state, action, _ in
    switch action {
    case .updateHeightSliderValue(let newValue):
        state.heightSliderValue = newValue
        return .none
    case .updateWidthSliderValue(let newValue):
        state.widthSliderValue = newValue
        return .none
    }
}

struct EggSizeView: View {
    var store: Store<EggSizeViewState, EggSizeViewAction>

    var body: some View {
        WithViewStore(self.store) { viewStore in
            VStack {
                ZStack {
                    Image("egg")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180)
                        .scaleEffect(1.3)
                    Button {
                        print("add")
                    } label: {
                        Label("Hinzufügen", systemImage: "plus")
                            .foregroundColor(.black)
                            .offset(y: 10)
                    }
                    VerticalCustomSlider(value: viewStore.binding(
                        get: \.heightSliderValue,
                        send: EggSizeViewAction.updateHeightSliderValue
                    ))
                        .frame(width: 25, height: 321)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                .padding(.horizontal)
                VStack(alignment: .leading, spacing: 5) {
                    VStack(alignment: .leading, spacing: 0) {
                        Group {
                            Text("Breite: 32mm")
                            Text("Höhe: 61mm")
                            Text("Dauer: 3min 20s")
                        }
                        .foregroundColor(.white)
                    }
                    HorizontalCustomSlider(value: viewStore.binding(
                        get: \.widthSliderValue,
                        send: EggSizeViewAction.updateWidthSliderValue
                    ))
                        .frame(height: 25)
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 35)
            }
        }
    }
}

struct EggSizeView_Previews: PreviewProvider {
    static var previews: some View {
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
