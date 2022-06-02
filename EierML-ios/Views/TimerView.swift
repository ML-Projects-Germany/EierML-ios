//
//  TimerView.swift
//  EierML-ios
//
//  Created by Torben Köhler on 02.06.22.
//

import SwiftUI

struct TimerView: View {
    var body: some View {
        ZStack {
            Text("Hallo")
                .frame(maxWidth: .infinity, maxHeight: 180)
                .safeAreaInset(edge: .bottom, content: {
                    Spacer().frame(height: 20)
                })
                .background(Material.thin)
                .padding(.bottom, -20)
                .cornerRadius(20, corners: [.topLeft, .topRight])
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
