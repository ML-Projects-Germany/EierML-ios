//
//  ArticleView.swift
//  clickbaitml-ios (iOS)
//
//  Created by Torben Köhler on 01.08.21.
//

import SwiftUI
import SwiftUIWPArticleLoader

struct ArticleView: View {
    var article: Article
    @State private var isLoading: Bool = false

    var body: some View {
        WebLoadingView(isShown: $isLoading, content: {
            WebView(url: article.link, cookies: nil, isLoading: $isLoading)
        })
        .ignoresSafeArea(.container, edges: .bottom)
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(article.title)
    }
}

struct ArtcleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(article: .mock)
    }
}
