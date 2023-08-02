//
//  UIView+Ex.swift
//  MultithreadingShips
//
//  Created by Pavel on 2.08.23.
//

import UIKit

extension UIView {
    func add(subviews: UIView...) {
        for subview in subviews {
            self.addSubview(subview)
        }
    }
}
