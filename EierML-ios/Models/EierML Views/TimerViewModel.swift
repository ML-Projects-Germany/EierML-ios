//
//  TimerViewModel.swift
//  EierML-ios
//
//  Created by Torben Köhler on 11.09.21.
//

import Foundation
import Combine

class TimerViewModel: ObservableObject {
    @Published var eggs: [Egg]
    @Published private(set) var isTimerRunning = false
    private var startTime =  Date()
    @Published var time: Int = 0
    @Published var timerString = "0:00"
    private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var cancellable: Set<AnyCancellable> = []

    init(eggs: [Egg]) {
        self.eggs = eggs.sorted(by: { $0.time < $1.time })
        self.stopTimer()
        timer
            .receive(on: DispatchQueue.main)
            .sink { [self] _ in
                if self.isTimerRunning {
                    let time = Int(Date().timeIntervalSince( self.startTime).rounded())
                    let minutes = Int(time/60)
                    let seconds = Int(time%60)
                    self.time = time
                    self.timerString = "\(minutes):\(seconds < 10 ? "0" : "")\(seconds)"
                }
            }
            .store(in: &cancellable)
    }
    deinit {
        stopTimer()
    }

    // MARK: Timer functions
    func stopTimer() {
        isTimerRunning = false
        self.timer.upstream.connect().cancel()
    }
    func startTimer() {
        isTimerRunning = true
        startTime = Date().addingTimeInterval(getTimeInterval())
        self.timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    }
    func resetTimer() {
        time = 0
        timerString = "0:00"
        startTime = Date()
        stopTimer()
    }
    private func getTimeInterval() -> TimeInterval {
        let time = timerString.split(separator: ":")
        var seconds: Int = (Int(time[0]) ?? 0)*60 + (Int(time[1]) ?? 0)
        seconds *= -1
        return TimeInterval(Float(seconds))
    }
}
