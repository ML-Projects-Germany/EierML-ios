//
//  EggSizeView.swift
//  EierML-ios
//
//  Created by Torben Köhler on 01.06.22.
//

import SwiftUI
import ComposableArchitecture

struct EggSizeViewState: Equatable {
    var deviceIsNotSupportedErrorIsShown: Bool = false

    var heightSliderValue: Double
    var widthSliderValue: Double

    init(heightSliderValue: Double, widthSliderValue: Double) {
        self.heightSliderValue = heightSliderValue
        self.widthSliderValue = widthSliderValue
    }

    var heightMM: Int {
        return Int(40+heightSliderValue*30)
    }

    var widthMM: Int {
        return Int(30+widthSliderValue*20)
    }
}

enum EggSizeViewAction {
    case updateHeightSliderValue(Double)
    case updateWidthSliderValue(Double)
    case showDeviceIsNotSupportedError(Bool)
    case sendMessageToSupport
}

var eggSizeViewReducer = Reducer<EggSizeViewState, EggSizeViewAction, Void> { state, action, _ in
    switch action {
    case .updateHeightSliderValue(let newValue):
        state.heightSliderValue = newValue
        return .none
    case .updateWidthSliderValue(let newValue):
        state.widthSliderValue = newValue
        return .none
    case .showDeviceIsNotSupportedError(let isShown):
        state.deviceIsNotSupportedErrorIsShown = isShown
        return .none
    case .sendMessageToSupport:
        return .none
    }
}

struct EggSizeView: View {
    var store: Store<EggSizeViewState, EggSizeViewAction>

    var body: some View {
        GeometryReader { geometry in
            WithViewStore(self.store) { viewStore in
                VStack {
                    ZStack {
                        ZStack {
                            Image("egg")
                                .resizable()
                                .frame(
                                    width: mmToPixel(viewStore.widthMM),
                                    height: mmToPixel(viewStore.heightMM)
                                )
                                .aspectRatio(contentMode: .fill)
                        }
                        .frame(width: geometry.size.width, height: geometry.size.width)
                        .opacity(PixelConverter.checkThatDeviceIsSupported() ? 1 : 0)
                        Button {
                            print("add")
                        } label: {
                            Label("Hinzufügen", systemImage: "plus")
                                .foregroundColor(.black)
                                .offset(y: 10)
                        }
                        .opacity(PixelConverter.checkThatDeviceIsSupported() ? 1 : 0)
                        VerticalCustomSlider(value: viewStore.binding(
                            get: \.heightSliderValue,
                            send: EggSizeViewAction.updateHeightSliderValue
                        ))
                            .frame(width: 25)
                            .shadow(color: .black.opacity(0.1), radius: 5)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .disabled(!PixelConverter.checkThatDeviceIsSupported())
                    }
                    VStack(alignment: .leading, spacing: 5) {
                        VStack(alignment: .leading, spacing: 0) {
                            Group {
                                Text("Breite: \(viewStore.widthMM)mm")
                                Text("Höhe: \(viewStore.heightMM)mm")
                            }
                            .foregroundColor(.white)
                            .shadow(color: .black.opacity(0.4), radius: 5)
                        }
                        HorizontalCustomSlider(value: viewStore.binding(
                            get: \.widthSliderValue,
                            send: EggSizeViewAction.updateWidthSliderValue
                        ))
                            .frame(height: 25)
                            .shadow(color: .black.opacity(0.1), radius: 5)
                            .disabled(!PixelConverter.checkThatDeviceIsSupported())
                    }
                    .padding(.horizontal, 20)
                }
                .onAppear {
                    viewStore.send(.showDeviceIsNotSupportedError(
                        !PixelConverter.checkThatDeviceIsSupported()
                    ))
                }
                .alert(
                    "Dein Gerät wird noch nicht unterstützt!",
                    isPresented: viewStore.binding(
                        get: \.deviceIsNotSupportedErrorIsShown,
                        send: EggSizeViewAction.showDeviceIsNotSupportedError
                    )
                ) {
                    Button(role: .destructive, action: {}, label: {
                        Text("Okay")
                    })
                    Button(role: .cancel) {
                        viewStore.send(.sendMessageToSupport)
                    } label: {
                        Text("Melden")
                    }
                } message: {
                    Text("Bitte melde uns welches Gerät du nutzt, damit du bald auch Eier ausmessen kannst.")
                }
            }
        }
    }

    func mmToPixel(_ mm: Int) -> CGFloat {
        return PixelConverter.getNormalPixelsForCentimeter(CGFloat(mm)/10)
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
            .padding()
        }
    }
}
