//
//  HomeViewModel.swift
//  EierML-ios
//
//  Created by Torben Köhler on 01.08.21.
//

import Foundation
import SwiftUIWPArticleLoader
import Combine

class HomeViewModel: ObservableObject {
    @Published var articles: [Article] = []
    private var cancellables: Set<AnyCancellable> = []

    init() {
        let handler = WPArticleLoader(websiteAdress: URL(staticString: "https://eierml.ml-projects.de/"))
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
