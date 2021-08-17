//
//  EierMLTutorialView.swift
//  EierML-ios
//
//  Created by Torben Köhler on 16.08.21.
//

import SwiftUI
import SwiftUIPager

struct EierMLTutorialView: View {
    @StateObject var page: Page = .first()
    private var tutorialSheets: [TutorialSheet] = [.mock, .mock]
    @State var pageValue = 1

    var body: some View {
        GeometryReader { reader in
            ZStack {
                Pager(page: page, data: tutorialSheets, id: \.id) { item in
                    pageView(item)
                }
                .preferredItemSize(CGSize(width: .greatestFiniteMagnitude, height: reader.size.height/2))
                .itemSpacing(20)
                .interactive(opacity: 0.5)
                .vertical()
                .sensitivity(.high)
//                .shadow(radius: 10)
                .shadow(color: .black.opacity(0.15), radius: 10)
                .padding(.horizontal, 20)
                .ignoresSafeArea()
                VStack {
                    Text("Tutorial")
                        .font(.title.bold())
                        .padding(.top)
                    Spacer()
                }
            }
        }
    }

    func pageView(_ tutorialSheet: TutorialSheet) -> some View {
        ZStack {
            Color.white
                .opacity(0.3)
            VStack {
                Text(tutorialSheet.title)
                    .font(.title2)
                    .fontWeight(.medium)
                    .padding()
                Text(tutorialSheet.text)
                    .padding([.horizontal, .bottom])
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .cornerRadius(20)
    }
}

struct EierMLTutorialView_Previews: PreviewProvider {
    static var previews: some View {
        EierMLTutorialView()
        EierMLTutorialView()
            .previewDevice("iPod touch (7th generation)")
    }
}
