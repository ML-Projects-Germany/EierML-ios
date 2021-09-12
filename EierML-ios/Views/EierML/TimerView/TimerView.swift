//
//  TimerView.swift
//  EierML-ios
//
//  Created by Torben Köhler on 07.09.21.
//

import SwiftUI

struct TimerView: View {
    @StateObject var model: TimerViewModel

    init(eggs: [Egg]) {
        self._model = StateObject(wrappedValue: TimerViewModel(eggs: eggs))
    }

    var body: some View {
        ZStack {
            VisualEffectView(effect: UIBlurEffect(style: .systemUltraThinMaterial))
                .ignoresSafeArea()
            ZStack {
                Color.white
                TimerEggsScrollView(model: model)
                    .frame(height: 400)
                VStack {
                    HStack {
                        Text("Eier-Timer")
                            .font(.largeTitle)
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                        Text(model.timerString)
                            .font(.largeTitle)
                            .fontWeight(.medium)
                            .padding()
                    }
                    Spacer()
                    Button(action: {
                        withAnimation(.easeOut) {
                            if model.isTimerRunning {
                                model.stopTimer()
                            } else {
                                model.startTimer()
                            }
                            model.isTimerRunning.toggle()
                        }
                    }, label: {
                        Text(model.isTimerRunning ? "Stop" : "Start")
                    })
                    .buttonStyle(SecondaryButtonStyle(color: .accentColor))
                    .padding()
                }
            }
            .frame(maxHeight: 500)
            .cornerRadius(25)
            .padding()
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            EggsView()
            TimerView(eggs: Egg.mocks)
        }
        ZStack {
            EggsView()
            TimerView(eggs: Egg.mocks)
        }
        .previewDevice("iPod touch (7th generation)")
    }
}

// with animation ;)
// .transition(.scale(scale: 0, anchor: .bottom))
// .zIndex(1.0)
