//
//  ArticleViewModel.swift
//  EierML-ios
//
//  Created by Torben Köhler on 28.09.21.
//

import Foundation
import UIKit
import AppTrackingTransparency

class ArticleViewModel: ObservableObject {
    @Published var isAllowedToShowWebContent: Bool

    init() {
        isAllowedToShowWebContent = ATTrackingManager.trackingAuthorizationStatus == .authorized
        ATTrackingManager.requestTrackingAuthorization { [weak self] status in
            DispatchQueue.main.async {
                self?.isAllowedToShowWebContent = status == .authorized
            }
        }
    }

    func openAppTrackingSettings() {
        guard let url = URL(string: UIApplication.openSettingsURLString),
              UIApplication.shared.canOpenURL(url) else {
                  assertionFailure("Not able to open App privacy settings")
                  return
              }

        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}
