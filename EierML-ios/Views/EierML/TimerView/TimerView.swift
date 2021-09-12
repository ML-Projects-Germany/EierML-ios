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
    @State var showAlert: Bool = false
    @State var alert: TimerAlert?

    enum TimerAlert {
        case reset, dismiss
    }

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
                            alert = .dismiss
                            showAlert = true
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
                        .padding(.bottom)
                        TimerEggsView(model: model)
                        HStack(spacing: 0) {
                            Button(action: {
                                if model.time > 0 {
                                    alert = .reset
                                    showAlert = true
                                }
                            }, label: {
                                Text("Zurücksetzen")
                                    .frame(minWidth: 120)
                            })
                            .buttonStyle(SecondaryButtonStyle(color: .accentColor))
                            .padding(10)
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
                                    .frame(minWidth: 50)
                            })
                            .buttonStyle(SecondaryButtonStyle(color: .accentColor))
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
        .alert(isPresented: $showAlert, content: {
            if alert == .reset {
                return Alert(
                    title: Text("Willst du den Timer wirklich zurücksetzen?"),
                    message: Text("Dies kann nicht wiederrufen werden."),
                    primaryButton: .default(Text("Zurücksetzen"), action: {
                        model.resetTimer()
                    }),
                    secondaryButton: .cancel(Text("Abbrechen"))
                )
            }
            return Alert(
                title: Text("Willst du den Timer wirklich verlassen?"),
                message: Text("Die Zeit wird zurück gesetzt."),
                primaryButton: .default(Text("Verlassen"), action: {
                    dismiss()
                }),
                secondaryButton: .cancel(Text("Abbrechen"))
            )
        })
    }

    var doneButtonOverlay: some View {
        VStack {
            Button(action: {
                if model.time > 0 {
                    alert = .dismiss
                    showAlert = true
                } else {
                    dismiss()
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

    func dismiss() {
        withAnimation(.easeOut) {
            isShown = false
        }
        Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { _ in
            model.resetTimer()
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
