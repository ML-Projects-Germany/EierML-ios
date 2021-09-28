//
//  ArticleView.swift
//  clickbaitml-ios (iOS)
//
//  Created by Torben Köhler on 01.08.21.
//

import SwiftUI
import SwiftUIWPArticleLoader
import AppTrackingTransparency

struct ArticleView: View {
    @ObservedObject var model: ArticleViewModel
    var article: Article
    @State private var isLoading: Bool = true

    init(article: Article) {
        self._model = ObservedObject(wrappedValue: ArticleViewModel())
        self.article = article
    }

    var body: some View {
        ZStack {
            if model.isAllowedToShowWebContent {
                WebLoadingView(isShown: $isLoading, content: {
                    WebView(url: article.link, cookies: nil, isLoading: $isLoading)
                })
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle(article.title)
            } else {
                VStack(spacing: 0) {
                    Text("AppTracking")
                        .font(.title3)
                        .fontWeight(.medium)
                    Text("Bitte erlaube AppTracking um Web-Inhalte von unserer Webseite zu sehen.")
                        .multilineTextAlignment(.center)
                        .padding()
                    Button {
                        model.openAppTrackingSettings()
                    } label: {
                        Text("Erlauben")
                    }
                    .buttonStyle(SecondaryButtonStyle(color: .Palette.red))
                }
            }
        }
    }
}

struct ArtcleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(article: .mock)
    }
}
