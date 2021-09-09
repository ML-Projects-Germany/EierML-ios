//
//  TimerScrollView.swift
//  EierML-ios
//
//  Created by Torben Köhler on 09.09.21.
//

import SwiftUI

struct TimerScrollView: View {
    @Binding var number: Int

    var body: some View {
        ScrollView {
            ScrollViewReader { scroller in
                Spacer().frame(width: 100, height: 100)
                Spacer().frame(width: 200, height: 200)
                    .id(0)
                ForEach(1..<100) { i in
                    Text("Example \(i)")
                        .font(.title)
                        .frame(width: 200, height: 200)
                        .id(i)
                        .scaleEffect(
                            CGSize(
                                width: number == i ? 1 : 0,
                                height: number == i ? 1 : 0
                            )
                        )
                        .opacity(number == i ? 1 : 0)
                }
                .onChange(of: number, perform: { _ in
                    withAnimation(.easeInOut(duration: 1)) {
                        scroller.scrollTo(number, anchor: .center)
                    }
                })
                Spacer().frame(width: 100, height: 100)
            }
        }
        .disabled(true)
    }
}

struct TimerScrollView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
