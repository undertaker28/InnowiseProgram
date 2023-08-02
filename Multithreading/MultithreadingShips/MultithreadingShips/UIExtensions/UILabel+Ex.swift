//
//  UILabel+Ex.swift
//  MultithreadingShips
//
//  Created by Pavel on 2.08.23.
//

import UIKit

extension UILabel {    
    func createInfoLabel(fontName: String, fontSize: CGFloat) -> UILabel {
        let label = UILabel()
        label.font = UIFont(name: fontName, size: fontSize)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }
}
