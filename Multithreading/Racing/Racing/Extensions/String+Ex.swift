//
//  String+Ex.swift
//  Racing
//
//  Created by Pavel on 4.08.23.
//

import Foundation

extension String {
    static func spaces(_ length: Int) -> String {
        return String(repeating: " ", count: length)
    }

    static func centered(_ content: String, length: Int) -> String {
        let totalSpaces = length - content.count
        let leftSpaces = totalSpaces / 2
        let rightSpaces = totalSpaces - leftSpaces
        return spaces(leftSpaces) + content + spaces(rightSpaces)
    }
}
