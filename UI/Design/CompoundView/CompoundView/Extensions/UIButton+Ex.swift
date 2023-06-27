//
//  UIButton+Ex.swift
//  CompoundView
//
//  Created by Pavel on 27.06.23.
//

import UIKit

extension UIButton {
    func createButton(titleName: String, size: CGFloat) -> UIButton {
        let button = UIButton()
        button.setTitle(titleName, for: .normal)
        button.titleLabel?.font = UIFont(name: "MarkPro-Bold", size: size)
        button.tintColor = .white
        button.backgroundColor = .black
        button.layer.cornerRadius = 20
        return button
    }
}
