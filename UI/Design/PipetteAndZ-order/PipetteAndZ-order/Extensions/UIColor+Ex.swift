//
//  UIColor+Ex.swift
//  PipetteAndZ-order
//
//  Created by Pavel on 17.06.23.
//

import UIKit

enum AssetsColor {
    case black
    case blue
    case green
    case lightBlue
    case purple
    case red
    case orange
    case silver
}

extension UIColor {
    static func appColor(_ name: AssetsColor) -> UIColor? {
        switch name {
        case .black:
            return UIColor(named: "Black")
        case .blue:
            return UIColor(named: "Blue")
        case .green:
            return UIColor(named: "Green")
        case .lightBlue:
            return UIColor(named: "LightBlue")
        case .purple:
            return UIColor(named: "Purple")
        case .red:
            return UIColor(named: "Red")
        case .orange:
            return UIColor(named: "Orange")
        case .silver:
            return UIColor(named: "Silver")
        }
    }
}
