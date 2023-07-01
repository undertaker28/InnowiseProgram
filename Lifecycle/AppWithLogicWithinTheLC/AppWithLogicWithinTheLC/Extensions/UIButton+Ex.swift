//
//  UIButton+Ex.swift
//  AppWithLogicWithinTheLC
//
//  Created by Pavel on 1.07.23.
//

import UIKit

extension UIButton {
    func createButton(titleName: String, size: CGFloat) -> UIButton {
        let button = UIButton()
        button.setTitle(titleName, for: .normal)
        button.tintColor = .white
        button.backgroundColor = .link
        button.layer.cornerRadius = 22
        button.addPressAnimation()
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
