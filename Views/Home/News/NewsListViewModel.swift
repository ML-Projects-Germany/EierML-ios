//
//  NewsListModel.swift
//  EierML-ios
//
//  Created by Torben Köhler on 08.08.21.
//

import Foundation
import SwiftUIWPArticleLoader
import Combine

class NewsListViewModel: ObservableObject {
    private var cancellables: Set<AnyCancellable> = []

    @Published var articles: [Article] = []

    func reloadArticles() {
        let handler = WPArticleLoader(websiteAdress: URL(staticString: "https://ml-projects.de"))
        handler.fetchArticles()
            .receive(on: DispatchQueue.main)
            .sink { response in
                switch response {
                case let .failure(error):
                    print(error)
                case .finished:
                    print("articles loaded")
                }
            } receiveValue: { [weak self] response in
                self?.articles = response
            }
            .store(in: &cancellables)
    }
}
