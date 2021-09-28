//
//  AlertViewModel.swift
//  EierML-ios
//
//  Created by Torben Köhler on 15.09.21.
//

struct AlertViewModel {
    let title: String
    let description: String
    let primaryButtonTitle: String

    init(
        title: String,
        description: String,
        primaryButtonTitle: String
    ) {
        self.title = title
        self.description = description
        self.primaryButtonTitle = primaryButtonTitle
    }
}
