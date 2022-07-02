//
//  TimerView.swift
//  EierML-ios
//
//  Created by Torben Köhler on 02.06.22.
//

import SwiftUI

struct TimerView: View {
    @State var height: Double = UIScreen.main.bounds.height*0.6

    var body: some View {
        let dragGesture = DragGesture()
            .onChanged {
                self.height = $0.translation.height
            }.onEnded {
                if $0.translation.height < UIScreen.main.bounds.height * 0.5 {
                    self.height = UIScreen.main.bounds.height*0.15
                } else {
                    self.height = UIScreen.main.bounds.height*0.6
                }
            }

        return GeometryReader { geometry in
            VStack(spacing: 0) {
                RoundedRectangle(cornerRadius: 3.5)
                    .foregroundColor(Color.white.opacity(0.8))
                    .frame(width: 80, height: 7)
                    .padding(8)
                    .gesture(dragGesture)
            }
            .frame(
                width: UIScreen.main.bounds.width,
                height: UIScreen.main.bounds.height,
                alignment: .top
            )
            .safeAreaInset(edge: .bottom, content: {
                Spacer().frame(height: geometry.safeAreaInsets.bottom)
            })
            .background(Material.thin)
            .cornerRadius(20, corners: [.topLeft, .topRight])
            .padding(.bottom, -(geometry.safeAreaInsets.top))
            .offset(y: height)
            .animation(.spring(), value: height)
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            AppView(store: .init(
                initialState: .init(),
                reducer: appReducer,
                environment: ()
            ))
            TimerView()
        }
    }
}
