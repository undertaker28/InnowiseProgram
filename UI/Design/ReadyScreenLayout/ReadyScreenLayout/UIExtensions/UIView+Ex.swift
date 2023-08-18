//
//  UIView+Ex.swift
//  ReadyScreenLayout
//
//  Created by Pavel on 19.06.23.
//

import UIKit

extension UIView {
    func add(subviews: UIView...) {
        for subview in subviews {
            self.addSubview(subview)
        }
    }
}
