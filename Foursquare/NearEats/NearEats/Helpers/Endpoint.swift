//
//  Endpoint.swift
//  NearEats
//
//  Created by Pavel on 6.08.23.
//

import Foundation

enum Endpoint {
    case places
    case tips(fsq_id: String)
    case photos(fsq_id: String)
}

extension Endpoint {
    static var baseURL: URL {
        guard let url = URL(string: "https://api.foursquare.com/") else { fatalError() }
        return url
    }
    
    var path: URL {
        switch self {
        case .places:
            return Endpoint.baseURL.appendingPathComponent("v3/places/search")
        case .tips(let fsq_id):
            return Endpoint.baseURL.appendingPathComponent("v3/places/\(fsq_id)/tips")
        case .photos(let fsq_id):
            return Endpoint.baseURL.appendingPathComponent("v3/places/\(fsq_id)/photos")
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .places, .tips, .photos:
            return ["Authorization": AuthConfiguration.authorizeKey, "Accept": "application/json"]
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .places:
            return ["query": "Ресторан и бар",
                    "ll": "53.9057644,27.5582305",
                    "radius": "4000",
                    "limit": "30",
                    "token": UserDefaultsHelper().getToken() ?? ""]
        case .tips, .photos:
            return ["token": UserDefaultsHelper().getToken() ?? ""]
        }
    }
}
