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
                        .multilineTextAlignment(.center)
                        .padding(.top)
                        .padding(.horizontal, 5)
                    VStack {
                        if let imageName = tutorialSheet.imageName {
                            Image(imageName)
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(10)
                                .padding(.bottom)
                        }
                        Text(tutorialSheet.text)
                            .multilineTextAlignment(.center)
                            .padding([.horizontal])
                            .minimumScaleFactor(0.1)
                    }
                    .frame(maxHeight: .infinity)
                    .padding(.top)
                }
                .padding(.horizontal)
                .padding(.bottom, 5)
                if tutorialSheet.doneButton {
                    Button(action: {
                        withAnimation(.easeInOut) {
                            dismissTutorial = true
                        }
                    }, label: {
                        Text("Fertig")
                            .frame(maxHeight: 13)
                    })
                    .buttonStyle(SecondaryButtonStyle(color: Color.Palette.red))
                    .padding()
                } else {
                    VStack(spacing: 0) {
                        Text("Wische nach oben um zum nächsten Schritt zu kommen")
                            .font(.system(size: 13))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        Image(systemName: "arrow.down")
                            .imageScale(.small)
                            .offset(x: 0, y: arrowIsOnTop ? -3 : 7)
                            .padding(EdgeInsets(top: 5, leading: 0, bottom: 10, trailing: 0))
                            .onAppear {
                                withAnimation(.easeInOut(duration: 2).repeatForever()) {
                                    arrowIsOnTop = false
                                }
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
