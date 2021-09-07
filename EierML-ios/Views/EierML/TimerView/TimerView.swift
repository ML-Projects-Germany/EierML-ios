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
                ScrollView {
                    ScrollViewReader { scroller in
                        AnyView {
                            withAnimation(.easeInOut) {
                                scroller.scrollTo(number, anchor: .center)
                            }
                        }
                        .padding()

                        ForEach(0..<100) { i in
                            Text("Example \(i)")
                                .font(.title)
                                .frame(width: 200, height: 200)
                                .id(i)
                        }
                    }
                }
                .disabled(true)
                Button(action: {
                    number+=1
                }, label: {
                    Text("Button")
                })
            }
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
    }
}

// with animation ;)
// .transition(.scale(scale: 0, anchor: .bottom))
// .zIndex(1.0)
