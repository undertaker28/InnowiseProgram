//
//  Error+Ex.swift
//  NearEats
//
//  Created by Pavel on 7.08.23.
//

import Foundation

extension NetworkingErrors {
    init(code: Int, url: URL) {
        switch code {
        case 100..<200:
            self = .informational(url: url)
        case 300..<400:
            self = .redirection(url: url)
        case 400..<500:
            self = .clientError(url: url)
        case 500..<600:
            self = .serverError(url: url)
        default:
            self = .unknown(url: url)
        }
    }
}
