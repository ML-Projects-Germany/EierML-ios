//
//  EggsView.swift
//  EierML-ios
//
//  Created by Torben Köhler on 12.08.21.
//

import SwiftUI

struct EggsView: View {
    @StateObject private var model: EggsViewModel
    @State var showTimerView: Bool = false

    init() {
        self._model = StateObject(wrappedValue: EggsViewModel())
    }

    var body: some View {
        GeometryReader { reader in
            ZStack {
                ClassicBackgroundView()
                    .ignoresSafeArea()
                ZStack {
                    ZStack {
                        EggListView(model: model)
                        VStack {
                            Spacer()
                            Button(action: {
                                withAnimation(.spring()) {
                                    showTimerView = true
                                }
                            }, label: {
                                Label(
                                    title: { Text("Timer") },
                                    icon: { Image(systemName: "clock") }
                                )
                            })
                            .buttonStyle(SecondaryButtonStyle(
                                color: Color.Palette.blue,
                                pressedColor: Color.Palette.darkBlue
                            ))
                            .padding()
                        }
                        TimerView(eggs: model.eggs, isShown: $showTimerView)
                    }
                    EierMLTutorialView(model: model)
                        .offset(x: model.eggTutorialIsShown ? 0 : -reader.size.width, y: 0)
                }
                .fullScreenCover(isPresented: $model.addEggViewIsPresented, content: {
                    AddEggView(model: model)
                })
            }
        }
    }
}

struct EggsView_Previews: PreviewProvider {
    static var previews: some View {
        EggsView()
        EggsView()
            .previewDevice("iPod touch (7th generation)")
    }
}
