//
//  UserDefaultsHelper.swift
//  NearEats
//
//  Created by Pavel on 6.08.23.
//

import Foundation

final class UserDefaultsHelper {
    enum UserDefaultsKeys: String {
        case token
    }
    
    func setToken(value: String) {
        let defaults = UserDefaults.standard
        defaults.set(value, forKey: UserDefaultsKeys.token.rawValue)
    }
    
    func getToken() -> String? {
        let defaults = UserDefaults.standard
        return defaults.string(forKey: UserDefaultsKeys.token.rawValue)
    }
    
    func clearToken() {
       let defaults = UserDefaults.standard
       defaults.removeObject(forKey: UserDefaultsKeys.token.rawValue)
    }
}
