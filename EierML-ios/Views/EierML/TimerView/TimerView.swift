//
//  TimerView.swift
//  EierML-ios
//
//  Created by Torben Köhler on 07.09.21.
//

import SwiftUI

struct TimerView: View {
    @ObservedObject var model: TimerViewModel
    @Binding var isShown: Bool
    @State var showDismissAlert: Bool = false
    @State var showResetAlert: Bool = false

    init(eggs: [Egg], isShown: Binding<Bool>) {
        self._model = ObservedObject(wrappedValue: TimerViewModel(eggs: eggs))
        self._isShown = isShown
    }

    var body: some View {
        GeometryReader { reader in
            ZStack {
                VisualEffectView(effect: UIBlurEffect(style: .systemUltraThinMaterial))
                    .ignoresSafeArea()
                    .opacity(isShown ? 1 : 0)
                    .onTapGesture {
                        if model.time > 0 {
                            showDismissAlert = true
                        } else {
                            dismiss()
                        }
                    }
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
                        .foregroundColor(.black)
                        .padding(.bottom)
                        TimerEggsView(model: model)
                        HStack(spacing: 0) {
                            Button(action: {
                                if model.time > 0 {
                                    showResetAlert = true
                                }
                            }, label: {
                                Text("Zurücksetzen")
                                    .frame(minWidth: 120)
                            })
                            .buttonStyle(SecondaryButtonStyle(
                                color: Color.Palette.blue,
                                pressedColor: Color.Palette.darkBlue
                            ))
                            .padding(10)
                            Button(action: {
                                withAnimation(.easeOut) {
                                    if model.isTimerRunning {
                                        model.stopTimer()
                                    } else {
                                        model.startTimer()
                                    }
                                }
                            }, label: {
                                Text(model.isTimerRunning ? "Stop" : "Start")
                                    .frame(minWidth: 50)
                            })
                            .buttonStyle(SecondaryButtonStyle(
                                color: Color.Palette.blue,
                                pressedColor: Color.Palette.darkBlue
                            ))
                            .padding(10)
                        }
                        .padding(.bottom, 5)
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
        .alertView(
            title: "Willst du den Timer wirklich zurücksetzen?",
            description: "Dies kann nicht wiederrufen werden.",
            primaryButtonTitle: "Zurücksetzen",
            show: $showResetAlert,
            action: {
                model.resetTimer()
                model.stopTimer()
            }
        )
        .alertView(
            title: "Willst du den Timer wirklich verlassen?",
            description: "Die Zeit wird zurück gesetzt.",
            primaryButtonTitle: "Verlassen",
            show: $showDismissAlert,
            action: {
                dismiss()
            }
        )
    }

    var doneButtonOverlay: some View {
        VStack {
            Button(action: {
                if model.time > 0 {
                    showDismissAlert = true
                } else {
                    dismiss()
                }
            }, label: {
                Text("Fertig")
                    .foregroundColor(Color.Palette.blue)
                    .fontWeight(.bold)
            })
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding(10)
            Spacer()
        }
    }

    func dismiss() {
        withAnimation(.easeOut) {
            isShown = false
        }
        Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { _ in
            model.resetTimer()
            model.stopTimer()
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
