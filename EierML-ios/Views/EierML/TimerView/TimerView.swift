//
//  TimerView.swift
//  EierML-ios
//
//  Created by Torben Köhler on 07.09.21.
//

import SwiftUI

struct TimerView: View {
    @State var number: Int = 0

    var body: some View {
        ZStack {
            VisualEffectView(effect: UIBlurEffect(style: .systemUltraThinMaterial))
                .ignoresSafeArea()
            ZStack {
                Color.white
                TimerScrollView(number: $number)
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
                            number+=1
                        }
                    }, label: {
                        Text("Stopp")
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
            TimerView()
        }
        ZStack {
            EggsView()
            TimerView()
        }
        .previewDevice("iPod touch (7th generation)")
    }
}

// with animation ;)
// .transition(.scale(scale: 0, anchor: .bottom))
// .zIndex(1.0)
