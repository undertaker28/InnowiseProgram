//
//  UIView+Ex.swift
//  Observer
//
//  Created by Pavel on 23.06.23.
//

import UIKit

extension UIView {
    func add(subviews: UIView...) {
        for subview in subviews {
            self.addSubview(subview)
        }
    }
}
