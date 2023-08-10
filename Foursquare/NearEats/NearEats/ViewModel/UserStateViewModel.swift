//
//  UserStateViewModel.swift
//  NearEats
//
//  Created by Pavel on 6.08.23.
//

import Foundation
import OAuthSwift

@MainActor
final class UserStateViewModel: ObservableObject {
    private let userDefaultsHelper = UserDefaultsHelper()
    private let fileSystemService = FileSystemService()
    @Published var isLoggedIn = false
    private var oauthswift = OAuth2Swift(consumerKey: AuthConfiguration.consumerKey, consumerSecret: AuthConfiguration.consumerSecret, authorizeUrl: AuthConfiguration.baseUrl + AuthConfiguration.authorizeUrl, responseType: AuthConfiguration.responseType)
    
    func logIn() async {
        oauthswift.authorize(withCallbackURL: URL(string: AuthConfiguration.callbackUrl)!, scope: "", state: "", completionHandler: { result in
            switch result {
            case .success((_, _, let parameters)):
                DispatchQueue.main.async {
                    let accessToken = parameters["access_token"] as? String
                    self.userDefaultsHelper.setToken(value: accessToken ?? "")
                    self.isLoggedIn = true
                }
            case .failure(let error):
                print(error)
            }
        })
    }
    
    func logOut() async {
        userDefaultsHelper.clearToken()
        fileSystemService.deleteAllFiles()
        isLoggedIn = false
    }
}
