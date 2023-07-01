//
//  UIView+Ex.swift
//  AppWithLogicWithinTheLC
//
//  Created by Pavel on 1.07.23.
//

import UIKit

extension UIView {
    func add(subviews: UIView...) {
        for subview in subviews {
            self.addSubview(subview)
        }
    }
}
