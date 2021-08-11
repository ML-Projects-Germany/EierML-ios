//
//  NewsListView.swift
//  EierML-ios
//
//  Created by Torben Köhler on 08.08.21.
//

import SwiftUI

struct NewsListView: View {
    @StateObject var model: NewsListViewModel

    init() {
        self._model = StateObject(wrappedValue: NewsListViewModel())
    }

    var body: some View {
        GeometryReader { reader in
            if !model.articles.isEmpty {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        Spacer()
                            .frame(width: 5)
                        ForEach(model.articles) { article in
                            NavigationLink(
                                destination: HTMLView(htmlString: article.content, baseURL: article.link),
                                label: {
                                    NewsRowView(article: article)
                                        .frame(width: rowWidth(reader: reader), height: 200)
                                        .padding(.vertical, 20)
                                })
                                .buttonStyle(NewsRowButtonStyle())
                        }
                        Spacer()
                            .frame(width: 5)
                    }
                }
            } else {
                LottieView(name: "loading-animation")
//                NewsImageLoadingView()
                    .frame(width: reader.size.width, height: 200)
                    .onAppear(perform: model.reloadArticles )
            }
        }
        .frame(height: 200)
    }

    func rowWidth(reader: GeometryProxy) -> CGFloat {
        if reader.size.width/10*8 <= 300 {
            return reader.size.width/10*8
        } else {
            return 300
        }
    }
}

struct NewsListView_Previews: PreviewProvider {
    static var previews: some View {
        NewsListView()
            .frame(maxWidth: .infinity, maxHeight: 300)
    }
}
