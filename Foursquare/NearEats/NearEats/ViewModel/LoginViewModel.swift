//
//  LoginViewModel.swift
//  NearEats
//
//  Created by Pavel on 9.08.23.
//

import Foundation
import OAuthSwift

final class LoginViewModel: ObservableObject {
    func handleOpenURL(_ url: URL) {
        if url.scheme == "oauth-swift" && url.host == "foursquare.com" {
            OAuth2Swift.handle(url: url)
        }
    }
}
