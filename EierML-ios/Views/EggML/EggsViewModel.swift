//
//  EggsViewModel.swift
//  EierML-ios
//
//  Created by Torben Köhler on 12.08.21.
//

import Foundation

class EggsViewModel: ObservableObject {
    @Published var eggs: [Egg] = []
}
