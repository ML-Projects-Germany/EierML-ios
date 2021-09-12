//
//  TimerView.swift
//  EierML-ios
//
//  Created by Torben Köhler on 07.09.21.
//

import SwiftUI

struct TimerView: View {
    @StateObject var model: TimerViewModel
    @Binding var isShown: Bool

    init(eggs: [Egg], isShown: Binding<Bool>) {
        self._model = StateObject(wrappedValue: TimerViewModel(eggs: eggs))
        self._isShown = isShown
    }

    var body: some View {
        GeometryReader { reader in
            ZStack {
                VisualEffectView(effect: UIBlurEffect(style: .systemUltraThinMaterial))
                    .ignoresSafeArea()
                    .opacity(isShown ? 1 : 0)
                ZStack {
                    Color.white
                    VStack(spacing: 0) {
                        HStack {
                            Text("Eier-Timer")
                                .font(.largeTitle)
                                .bold()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding([.top, .leading])
                            Text(model.timerString)
                                .font(.largeTitle)
                                .fontWeight(.medium)
                                .padding([.top, .trailing])
                        }
                        .padding(.bottom)
                        TimerEggsView(model: model)
                            .padding(.horizontal)
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
                .offset(x: 0, y: isShown ? 0 : reader.size.height)
                doneButtonOverlay
                    .opacity(isShown ? 1 : 0)
            }
        }
    }

    var doneButtonOverlay: some View {
        VStack {
            Button(action: {
                withAnimation(.easeOut) {
                    isShown = false
                }
            }, label: {
                Text("Fertig")
                    .foregroundColor(.accentColor)
                    .fontWeight(.bold)
            })
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding(10)
            Spacer()
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            EggsView()
            TimerView(eggs: Egg.mocks, isShown: .constant(true))
        }
        ZStack {
            EggsView()
            TimerView(eggs: Egg.mocks, isShown: .constant(true))
        }
        .previewDevice("iPod touch (7th generation)")
    }
}

// with animation ;)
// .transition(.scale(scale: 0, anchor: .bottom))
// .zIndex(1.0)
