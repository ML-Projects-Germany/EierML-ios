//
//  VerticalSliderView.swift
//  EierML-ios
//
//  Created by Torben Köhler on 01.06.22.
//

import SwiftUI

struct VerticalSliderView: View {
    var height: Double
    @State private var cacheState: Double?
    @State var state: Double = 0.5
    @State var onEdit: Bool = false

    init(height: Double) {
        self.height = height
        self.cacheState = nil
    }

    var drag: some Gesture {
        DragGesture()
            .onChanged { coordinate in
                if cacheState == nil {
                    cacheState = state
                }
                state = cacheState! + min(height/coordinate.translation.height, 1)
            }
            .onEnded { coordinate in
                print("")
            }
    }

    var body: some View {
        VStack {
            Text("\(state)")
            ZStack(alignment: .bottom) {
                Rectangle()
                    .foregroundColor(Color.white.opacity(0.5))
                Image(systemName: "ellipsis")
                    .foregroundColor(onEdit ? Color(hex: "5E5E5E") : .clear)
                    .gesture(drag)
                    .padding(.top, 6)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                    .frame(height: state * height)
                    .background(Color.white)
            }
            .frame(width: onEdit ? 27 : 15, height: self.height)
            .cornerRadius(7.5)
            .onTapGesture {
                withAnimation(.spring().speed(1.4)) {
                    onEdit.toggle()
                }
            }
        }
    }
}

struct VerticalSliderView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            VerticalSliderView(height: 100)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.orange)
        .ignoresSafeArea()
    }
}
