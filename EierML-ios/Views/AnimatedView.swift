//
//  AnimatedView.swift
//  EierML-ios
//
//  Created by Torben Köhler on 14.06.22.
//

import SwiftUI

struct AnimatedView: View {
    @Namespace var namespace
    @State var show: Bool = true

    var body: some View {
        ZStack {
            if !show {
                VStack(alignment: .leading) {
                    Text("Dein Ei")
                        .font(.headline)
                        .matchedGeometryEffect(id: "title", in: namespace)
                    Text("23mm x 30mm")
                        .matchedGeometryEffect(id: "text", in: namespace)
                }
                .foregroundColor(.white)
                .padding(.horizontal)
                .frame(width: 200, height: 70, alignment: .leading)
                .background(.red)
                .cornerRadius(10)
            } else {
                VStack(alignment: .leading) {
                    Text("Dein Ei")
                        .font(.headline)
                        .matchedGeometryEffect(id: "title", in: namespace)
                    Spacer()
                    Text("23mm x 30mm")
                        .matchedGeometryEffect(id: "text", in: namespace)
                }
                .foregroundColor(.white)
                .padding()
                .frame(width: 200, height: 150, alignment: .topLeading)
                .background(.red)
                .cornerRadius(10)
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
