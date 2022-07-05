//
//  AnimatedView.swift
//  EierML-ios
//
//  Created by Torben Köhler on 14.06.22.
//

import SwiftUI

struct AnimatedView: View {
    @Namespace var namespace
    @State var show: Bool = !true

    var body: some View {
        ZStack {
            AppBackground()
            if show {
                Image("egg")
                    .resizable()
                    .matchedGeometryEffect(id: "egg", in: namespace)
                    .frame(width: 200, height: 300)
            } else {
                Image("egg")
                    .resizable()
                    .matchedGeometryEffect(id: "egg", in: namespace)
                    .frame(width: 60, height: 80)
            }
        }
        .onTapGesture {
            withAnimation(.spring()) {
                show.toggle()
            }
        }
    }
}

struct AnimatedView_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedView()
    }
}
