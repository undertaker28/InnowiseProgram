//
//  UIView+Ex.swift
//  CompoundView
//
//  Created by Pavel on 27.06.23.
//

import UIKit

extension UIView {
    func add(subviews: UIView...) {
        for subview in subviews {
            self.addSubview(subview)
        }
    }
}
