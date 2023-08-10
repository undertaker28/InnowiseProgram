//
//  Photo.swift
//  NearEats
//
//  Created by Pavel on 8.08.23.
//

import Foundation

struct Photo: Identifiable, Codable {
    let id = UUID()
    let created_at: String
    let prefix: String
    let suffix: String
    let width: Int
    let height: Int
}
