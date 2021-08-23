//
//  TutorialSheetView.swift
//  EierML-ios
//
//  Created by Torben Köhler on 23.08.21.
//

import SwiftUI

struct TutorialSheetView: View {
    var tutorialSheet: TutorialSheet

    @State private var isAnimated = false

    init(_ tutorialSheet: TutorialSheet) {
        self.tutorialSheet = tutorialSheet
    }

    var body: some View {
        ZStack {
            Color.white
                .opacity(0.3)
            VStack(spacing: 0) {
                Text(tutorialSheet.title)
                    .font(.title2)
                    .fontWeight(.medium)
                    .padding()
                Text(tutorialSheet.text)
                    .padding([.horizontal, .bottom])
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                Text("Wische nach oben um zum nächsten Schritt zu kommen.")
                    .font(.system(size: 10))
                    .multilineTextAlignment(.center)
                Image(systemName: "arrow.down")
                    .imageScale(.small)
                    .padding(.top, 5)
                    .padding(.bottom, 10)
                    .offset(x: 0, y: /*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
            }
        }
        .cornerRadius(20)
    }
}

struct TutorialSheetView_Previews: PreviewProvider {
    static var previews: some View {
//        ContentView()
        ZStack {
            ClassicBackgroundView()
                .ignoresSafeArea()
            EierMLTutorialView()
        }
        ZStack {
            ClassicBackgroundView()
                .ignoresSafeArea()
            EierMLTutorialView()
        }
        .previewDevice("iPod touch (7th generation)")
    }
}

struct ContentView: View {
    @State private var isLoading = false
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color(.systemGray5), lineWidth: 14)
                .frame(width: 100, height: 100)

            Circle()
                .trim(from: 0, to: 0.2)
                .stroke(Color.green, style: .init(lineWidth: 7, lineCap: .round, lineJoin: .miter, miterLimit: 0, dash: [1, 0], dashPhase: 0))
                .frame(width: 100, height: 100)
                .rotationEffect(Angle(degrees: isLoading ? 360 : .zero))
                .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
                .onAppear {
                    self.isLoading = true
                }
        }
    }
}
