//
//  UIButton+Ex.swift
//  DynamicUIChanges
//
//  Created by Pavel on 25.06.23.
//

import SnapKit

extension UIButton {
    func createButton(tagId: Int?, titleName: String, size: CGFloat) -> UIButton {
        let button = UIButton()
        button.tag = tagId ?? 0
        button.setTitle(titleName, for: .normal)
        button.titleLabel?.font = UIFont(name: "MarkPro-Bold", size: size)
        button.tintColor = .white
        button.backgroundColor = UIColor(named: "UltramarineBlue")
        button.layer.cornerRadius = 22
        return button
    }
}
