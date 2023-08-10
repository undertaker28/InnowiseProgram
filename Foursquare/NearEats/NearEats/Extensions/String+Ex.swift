//
//  String+Ex.swift
//  NearEats
//
//  Created by Pavel on 9.08.23.
//

import Foundation

extension String {
    func formattedDate() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        if let date = dateFormatter.date(from: self) {
            dateFormatter.dateFormat = "MMM d, yyyy, HH:mm"
            return dateFormatter.string(from: date)
        }
        return nil
    }
}
