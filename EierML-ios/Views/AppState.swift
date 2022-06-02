//
//  AppState.swift
//  EierML-ios
//
//  Created by Torben Köhler on 12.09.21.
//

import Foundation
import ComposableArchitecture

struct AppState: Equatable {
    var currentPage: Page = .main

    enum Page {
        case main, settings, articles
    }
}

enum AppAction: Equatable {
    case changePage(AppState.Page)
}

let appReducer = Reducer<AppState, AppAction, Void> { state, action, _ in
    switch action {
    case .changePage(let page):
        state.currentPage = page
        return .none
    }
}
