//
//  UIView+Ex.swift
//  DynamicUIChanges
//
//  Created by Pavel on 25.06.23.
//

import UIKit

extension UIView {
    func add(subviews: UIView...) {
        for subview in subviews {
            self.addSubview(subview)
        }
    }
}
