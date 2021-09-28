//
//  NewsImageLoadingView.swift
//  Clickbait ML Multi
//
//  Created by Torben Köhler on 13.06.21.
//

import SwiftUI

struct NewsImageLoadingView: View {
    @State private var isAtMaxScale = false

    private let animation = Animation.easeInOut(duration: 1).repeatForever(autoreverses: true)
    private let maxScale: CGFloat = 1.3

    var body: some View {
        Image(systemName: "photo")
            .foregroundColor(.white)
            .imageScale(.large)
            .scaleEffect(isAtMaxScale ? maxScale : 1)
            .shadow(radius: 10)
            .onAppear {
                withAnimation(self.animation, {
                    self.isAtMaxScale.toggle()
                })
            }
    }
}

struct NewsImageLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.blue
            NewsImageLoadingView()
        }
        .ignoresSafeArea()
    }
}
