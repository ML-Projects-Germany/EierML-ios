//
//  GridItem+getItems.swift
//  EierML-ios
//
//  Created by Torben Köhler on 12.09.21.
//

import SwiftUI

extension GridItem {
    static func getItems(for size: GridItem.Size, count: Int) -> [GridItem] {
        var response: [GridItem] = []
        for _ in 0...count-1 {
            response.append(.init(size))
        }
        return response
    }
}
