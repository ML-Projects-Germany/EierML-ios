//
//  TimerView.swift
//  EierML-ios
//
//  Created by Torben Köhler on 02.06.22.
//

import SwiftUI

struct TimerView: View {
    @State var height: Double = 200

    var body: some View {
        let dragGesture = DragGesture(minimumDistance: 1).onChanged { drag in
            withAnimation(.easeOut) {
                self.height = 200 + (drag.location.y - drag.translation.height)
            }
            print(height)
            print(drag.location.y)
            print(drag.translation.height)
            print("---")
        }

        return GeometryReader { geometry in
            VStack(spacing: 0) {
                RoundedRectangle(cornerRadius: 3.5)
                    .foregroundColor(Color.white.opacity(0.8))
                    .frame(width: 80, height: 7)
                    .padding(8)
                    .gesture(dragGesture)
                Text("\(self.height)")
            }
            .frame(
                maxWidth: .infinity,
                maxHeight: max(min(height, 900), 200),
                alignment: .top
            )
            .safeAreaInset(edge: .bottom, content: {
                Spacer().frame(height: geometry.safeAreaInsets.bottom)
            })
            .background(Material.thin)
            .cornerRadius(20, corners: [.topLeft, .topRight])
            .padding(.bottom, -geometry.safeAreaInsets.bottom)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            AppView(store: .init(
                initialState: .init(currentPage: .main),
                reducer: appReducer,
                environment: ()
            ))
            TimerView()
        }
    }
}
