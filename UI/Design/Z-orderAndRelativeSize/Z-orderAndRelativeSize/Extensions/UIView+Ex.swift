//
//  UIView+Ex.swift
//  Z-orderAndRelativeSize
//
//  Created by Pavel on 16.06.23.
//

import UIKit

extension UIView {    
    func createColoredView(withColor color: UIColor) -> UIView {
        let view = UIView()
        view.backgroundColor = color
        return view
    }
}
