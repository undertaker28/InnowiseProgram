//
//  UIView+Ex.swift
//  WorkWithLists
//
//  Created by Pavel on 3.07.23.
//

import UIKit

extension UIView {
    func add(subviews: UIView...) {
        for subview in subviews {
            self.addSubview(subview)
        }
    }
}
