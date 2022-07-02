//
//  AppState.swift
//  EierML-ios
//
//  Created by Torben Köhler on 12.09.21.
//

import Foundation
import ComposableArchitecture

struct AppState: Equatable {

}

enum AppAction: Equatable {

}

let appReducer = Reducer<AppState, AppAction, Void> { state, action, _ in
    switch action {
    default:
        return .none
    }
}
