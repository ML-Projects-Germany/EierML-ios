//
//  EggCardsListView.swift
//  EierML-ios
//
//  Created by Torben Köhler on 10.12.21.
//

import SwiftUI

struct ScrollViewOffsetPreferenceKey: PreferenceKey {
    typealias Value = CGFloat
    static var defaultValue: CGFloat = .zero

    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

struct EggCardsListView: View {
    @State private var selectedItem: Int = 0
    var eggs: [Egg]

    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                LazyVStack(spacing: -15) {
                    Spacer()
                        .frame(height: geometry.size.height/2-60)
                    ForEach(eggs) { egg in
                        GeometryReader { proxy in
                            let offset = proxy.frame(in: .named("scroll")).minY
                            EggCardView(egg: egg)
                                .padding()
                            Color.clear.preference(key: ScrollViewOffsetPreferenceKey.self, value: )
                        }
                    }
                    Spacer()
                        .frame(height: geometry.size.height/2-60)
                }
            }
            .coordinateSpace(name: "scroll")
            .onPreferenceChange(ScrollViewOffsetPreferenceKey.self) { value in
                print(value)
            }
        }
    }
}

struct EggCardsListView_Previews: PreviewProvider {
    static var previews: some View {
        EggCardsListView(eggs: Egg.generateMocks(10))
    }
}
