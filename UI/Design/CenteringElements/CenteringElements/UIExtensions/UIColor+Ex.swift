//
//  UIColor+Ex.swift
//  CenteringElements
//
//  Created by Pavel on 14.06.23.
//

import UIKit

enum AssetsColor {
    case purple
    case red
    case yellow
    case green
    case black
}

extension UIColor {
    static func appColor(_ name: AssetsColor) -> UIColor? {
        switch name {
        case .purple:
            return UIColor(named: "Purple")
        case .red:
            return UIColor(named: "Red")
        case .yellow:
            return UIColor(named: "Yellow")
        case .green:
            return UIColor(named: "Green")
        case .black:
            return UIColor(named: "Black")
        }
    }
}
