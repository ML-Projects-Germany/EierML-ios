//
//  TimerViewModel.swift
//  EierML-ios
//
//  Created by Torben Köhler on 11.09.21.
//

import Foundation

class TimerViewModel: ObservableObject {
    @Published var currentScrollStep: Int = 0
    @Published var eggs: [Egg]

    init(eggs: [Egg]) {
        self.eggs = eggs
    }
}
