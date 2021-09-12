//
//  AppModel.swift
//  EierML-ios
//
//  Created by Torben Köhler on 12.09.21.
//

import SwiftUI

class AppModel: ObservableObject {
    @AppStorage("firstAppStart") var firstAppStart: Bool = true
}
