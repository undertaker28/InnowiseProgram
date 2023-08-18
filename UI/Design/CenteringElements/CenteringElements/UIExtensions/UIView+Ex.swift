//
//  UIView+Ex.swift
//  CenteringElements
//
//  Created by Pavel on 13.06.23.
//

import UIKit

extension UIView {
    func add(subviews: UIView...) {
        for subview in subviews {
            self.addSubview(subview)
        }
    }
    
    func createColoredView(withColor color: UIColor) -> UIView {
        let view = UIView()
        view.backgroundColor = color
        return view
    }
}
