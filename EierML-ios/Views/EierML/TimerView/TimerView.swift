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
                TimerScrollView(model: model)
                    .frame(height: 400)
                VStack {
                    HStack {
                        Text("Eier-Timer")
                            .font(.largeTitle)
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                        Text("0:00")
                            .font(.largeTitle)
                            .fontWeight(.medium)
                            .padding()
                    }
                    Spacer()
                    Button(action: {
                        withAnimation(.easeOut) {
                            model.currentScrollStep+=1
                        }
                    }, label: {
                        Text("Start")
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
        MyTimerView()
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

struct MyTimerView: View {
    @State var isTimerRunning = false
    @State private var startTime =  Date()
    @State private var timerString = "0"
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {

        Text(self.timerString)
            .font(Font.system(.largeTitle, design: .monospaced))
            .onReceive(timer) { _ in
                if self.isTimerRunning {
                    timerString = String(Int(Date().timeIntervalSince( self.startTime).rounded()))
                }
            }
            .onTapGesture {
                if isTimerRunning {
                    // stop UI updates
                    self.stopTimer()
                } else {
//                    timerString = "0.00"
                    startTime = Date().addingTimeInterval(TimeInterval(Float("-"+timerString) ?? 0))
                    // start UI updates
                    self.startTimer()
                }
                isTimerRunning.toggle()
            }
            .onAppear {
                // no need for UI updates at startup
                self.stopTimer()
            }
    }

    func stopTimer() {
        self.timer.upstream.connect().cancel()
    }

    func startTimer() {
        self.timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    }
}
