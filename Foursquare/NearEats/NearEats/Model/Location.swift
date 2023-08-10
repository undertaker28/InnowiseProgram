//
//  Location.swift
//  NearEats
//
//  Created by Pavel on 9.08.23.
//

import Foundation

struct Location: Codable {
    let address: String?
    let address_extended: String?
    let census_block: String?
    let country: String
    let dma: String?
    let formatted_address: String
    let locality: String?
    let postcode: String?
    let region: String?
}
