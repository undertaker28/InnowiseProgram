//
//  Place.swift
//  NearEats
//
//  Created by Pavel on 6.08.23.
//

import Foundation

struct Root: Codable {
    let results: [Place]
}

struct Place: Identifiable, Codable {
    let id = UUID()
    let fsq_id: String
    let categories: [Category]
    let distance: Float
    let location: Location
    let name: String
}
