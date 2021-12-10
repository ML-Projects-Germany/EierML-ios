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
                        .frame(height: geometry.size.height/2)
                    ForEach(eggs) { egg in
                        GeometryReader { cellGeometry in
                            let offset = cellGeometry.frame(in: .named("scroll")).minY
                            EggCardView(egg: egg)
                                .padding()
                                .opacity(
                                    checkIfCellIsMiddle(
                                        viewHeight: geometry.size.height,
                                        offset: offset
                                    ) ? 1 : 0.5
                                )
                                .scaleEffect(
                                    checkIfCellIsMiddle(
                                        viewHeight: geometry.size.height,
                                        offset: offset
                                    ) ? 1 : 0.9
                                )
                                .animation(.easeInOut(duration: 0.2), value: checkIfCellIsMiddle(
                                    viewHeight: geometry.size.height,
                                    offset: offset
                                ))
                        }
                        .frame(height: 110)
                    }
                    Spacer()
                        .frame(height: geometry.size.height/2-60)
                }
            }
            .coordinateSpace(name: "scroll")
        }
    }

    func checkIfCellIsMiddle(viewHeight: CGFloat, offset: CGFloat) -> Bool {
        return offset > viewHeight/2-48 && offset < viewHeight/2+48
    }
}

struct EggCardsListView_Previews: PreviewProvider {
    static var previews: some View {
        EggCardsListView(eggs: Egg.generateMocks(10))
    }
}
