//
//  UIColor+Ex.swift
//  Z-orderAndRelativeSize
//
//  Created by Pavel on 16.06.23.
//

import UIKit

enum AssetsColor {
    case apricot
    case red
    case purple
}

extension UIColor {
    static func appColor(_ name: AssetsColor) -> UIColor? {
        switch name {
        case .apricot:
            return UIColor(named: "Apricot")
        case .red:
            return UIColor(named: "Red")
        case .purple:
            return UIColor(named: "Purple")
        }
    }
}
