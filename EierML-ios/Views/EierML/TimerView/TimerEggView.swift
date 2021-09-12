//
//  TimerEggView.swift
//  EierML-ios
//
//  Created by Torben Köhler on 12.09.21.
//

import SwiftUI
import AVFoundation

struct TimerEggView: View {
    @State private var alarmSoundEffect: AVAudioPlayer?

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onAppear {
                let path = Bundle.main.path(forResource: "example.mp3", ofType: "mp3")!
                let url = URL(fileURLWithPath: path)
                do {
                    alarmSoundEffect = try AVAudioPlayer(contentsOf: url)
                    alarmSoundEffect?.play()
                } catch {
                    print("cant load alarm ton")
                }
            }
    }
}

struct TimerEggView_Previews: PreviewProvider {
    static var previews: some View {
        TimerEggView()
    }
}
