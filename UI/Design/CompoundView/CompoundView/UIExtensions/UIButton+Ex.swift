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
    
    func addPressAnimation() {
        addTarget(self, action: #selector(animateDown), for: [.touchDown, .touchDragEnter])
        addTarget(self, action: #selector(animateUp), for: [.touchDragExit, .touchCancel, .touchUpInside, .touchUpOutside])
    }

    @objc private func animateDown(sender: UIButton) {
        animate(sender, transform: CGAffineTransform.identity.scaledBy(x: 0.95, y: 0.95))
    }

    @objc private func animateUp(sender: UIButton) {
        animate(sender, transform: .identity)
    }

    private func animate(_ button: UIButton, transform: CGAffineTransform) {
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 3, options: [.curveEaseInOut], animations: {
            button.transform = transform
        }, completion: nil)
    }
}
