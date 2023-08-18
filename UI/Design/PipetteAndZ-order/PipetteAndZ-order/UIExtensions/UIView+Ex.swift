//
//  UIView+Ex.swift
//  PipetteAndZ-order
//
//  Created by Pavel on 17.06.23.
//

import UIKit

extension UIView {
    func add(subviews: UIView...) {
        for subview in subviews {
            self.addSubview(subview)
        }
    }
    
    func createColoredView(backgroundColor: UIColor, borderColor: UIColor) -> UIView {
        let view = UIView()
        view.backgroundColor = backgroundColor
        view.layer.borderWidth = 1
        view.layer.borderColor = borderColor.cgColor
        return view
    }
}
