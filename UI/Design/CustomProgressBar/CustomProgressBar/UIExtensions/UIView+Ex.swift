//
//  UIView+Ex.swift
//  CustomProgressBar
//
//  Created by Pavel on 28.06.23.
//

import UIKit

extension UIView {
    func add(subviews: UIView...) {
        for subview in subviews {
            self.addSubview(subview)
        }
    }
}
