//
//  TimerEggView.swift
//  EierML-ios
//
//  Created by Torben Köhler on 12.09.21.
//

import SwiftUI
import AVFoundation

struct TimerEggsView: View {
    @ObservedObject var model: TimerViewModel
    @State private var alarmSoundEffect: AVAudioPlayer?

    var body: some View {
        GeometryReader { reader in
            LazyVGrid(
                columns: GridItem.getItems(
                    for: .fixed(reader.size.width/CGFloat(Int(reader.size.width/65))-20),
                    count: Int(reader.size.width/75)
                ),
                alignment: .center,
                content: {
                    ForEach(model.eggs) { egg in
                        EggImageViewWithNumber(number: egg.number)
                            .frame(width: 55, height: 55)
                            .opacity(egg.time <= model.time ? 1 : 0.2)
                            .onChange(of: model.time, perform: { value in
                                if egg.time == model.time {
                                    startSound()
                                }
                            })
                    }
                    .padding(5)
                })
        }
    }
    func startSound() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)

        let path = Bundle.main.path(forResource: "bell", ofType: "mp3")!
        let url = URL(fileURLWithPath: path)
        do {
            _ = try? AVAudioSession
                .sharedInstance()
                .setCategory(
                    AVAudioSession.Category.playback, mode: .default, options: .duckOthers
                )
            alarmSoundEffect = try AVAudioPlayer(contentsOf: url)
            alarmSoundEffect?.play()
            Timer.scheduledTimer(withTimeInterval: 2.5, repeats: false) { _ in
                _ = try? AVAudioSession
                    .sharedInstance()
                    .setCategory(
                        AVAudioSession.Category.playback, mode: .default, options: .mixWithOthers
                    )
            }
        } catch {
            print("cant load alarm ton")
        }
    }
}

struct TimerEggView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(eggs: Egg.mocks, isShown: .constant(true))
        TimerView(eggs: Egg.mocks, isShown: .constant(true))
            .previewDevice("iPod touch (7th generation)")
    }
}
