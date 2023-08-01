//
//  UIView+Ex.swift
//  Chronometer
//
//  Created by Pavel on 1.08.23.
//

import UIKit

extension UIView {
    func add(subviews: UIView...) {
        for subview in subviews {
            self.addSubview(subview)
        }
    }
}
