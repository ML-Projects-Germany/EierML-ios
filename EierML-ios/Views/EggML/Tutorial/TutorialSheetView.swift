//
//  TutorialSheetView.swift
//  EierML-ios
//
//  Created by Torben Köhler on 23.08.21.
//

import SwiftUI

struct TutorialSheetView: View {
    private var tutorialSheet: TutorialSheet
    @Binding private var dismissTutorial: Bool

    @State private var isAnimated = false
    @State private var arrowIsOnTop: Bool = true

    init(_ tutorialSheet: TutorialSheet, dismissTutorial: Binding<Bool>) {
        self.tutorialSheet = tutorialSheet
        self._dismissTutorial = dismissTutorial
    }

    var body: some View {
        ZStack {
            Color.white
                .opacity(0.3)
            VStack(spacing: 0) {
                Group {
                    Text(tutorialSheet.title)
                        .font(.title2)
                        .fontWeight(.medium)
                        .padding()
                    Text(tutorialSheet.text)
                        .padding([.horizontal, .bottom])
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .padding(.horizontal)
                .padding(.bottom, 5)
                ZStack {
                    if tutorialSheet.fertigButton {
                        Button(action: {

                        }, label: {
                            Text("Fertig")
                                .frame(maxHeight: 13)
                        })
                        .buttonStyle(SecondaryButtonStyle(color: Color.Palette.red))
                        .padding()
                    } else {
                        VStack(spacing: 0) {
                            Text("Wische nach oben um zum nächsten Schritt zu kommen.")
                                .font(.system(size: 10))
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            Image(systemName: "arrow.down")
                                .imageScale(.small)
                                .padding(.top, 5)
                                .padding(.bottom, 10)
                                .offset(x: 0, y: arrowIsOnTop ? -4 : 7)
                                .animation(.easeInOut(duration: 2).repeatForever())
                                .onAppear { arrowIsOnTop = false }
                        }
                    }
                }
            }
        }
        .cornerRadius(20)
    }
}

struct TutorialSheetView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            ClassicBackgroundView()
                .ignoresSafeArea()
            EierMLTutorialView(dismissTutorial: .constant(true))
        }
        ZStack {
            ClassicBackgroundView()
                .ignoresSafeArea()
            EierMLTutorialView(dismissTutorial: .constant(true))
        }
        .previewDevice("iPod touch (7th generation)")
    }
}
