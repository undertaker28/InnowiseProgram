//
//  UserDefaultsHelper.swift
//  NearEats
//
//  Created by Pavel on 6.08.23.
//

import Foundation

protocol UserDefaultsHelper {
    func setToken(value: String)
    func getToken() -> String?
    func clearToken()
}

final class UserDefaultsHelperImpl: UserDefaultsHelper {
    private let defaults = UserDefaults.standard
    
    func setToken(value: String) {
        defaults.set(value, forKey: "token")
    }
    
    func getToken() -> String? {
        return defaults.string(forKey: "token")
    }
    
    func clearToken() {
       defaults.removeObject(forKey: "token")
    }
}
