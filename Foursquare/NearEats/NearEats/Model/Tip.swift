//
//  Tip.swift
//  NearEats
//
//  Created by Pavel on 8.08.23.
//

import Foundation

struct Tip: Identifiable, Codable {
    let id = UUID()
    let created_at: String
    let text: String
}
