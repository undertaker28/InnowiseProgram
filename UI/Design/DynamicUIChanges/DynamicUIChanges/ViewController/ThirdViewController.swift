//
//  ThirdViewController.swift
//  DynamicUIChanges
//
//  Created by Pavel on 25.06.23.
//

import UIKit
import SnapKit

final class ThirdViewController: UIViewController {
    private lazy var currentAlpha: CGFloat = 1.0

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView().createImageView(imageName: "ItachiUchiha")
        imageView.alpha = currentAlpha
        return imageView
    }()

    private lazy var addAlphaButton: UIButton = {
        let button = UIButton().createButton(tagId: nil, titleName: "Add alpha", size: 20)
        button.addTarget(self, action: #selector(addAlphaButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var removeAlphaButton: UIButton = {
        let button = UIButton().createButton(tagId: nil, titleName: "Remove alpha", size: 20)
        button.addTarget(self, action: #selector(removeAlphaButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var stackViewOfButtons: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [addAlphaButton, removeAlphaButton])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 16
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "Black")
        view.add(subviews: imageView, stackViewOfButtons)
        makeConstraints()
    }
    
    @objc func addAlphaButtonTapped() {
        let newAlpha = max(0.0, currentAlpha - 0.1)
        animateAlphaChange(to: newAlpha)
    }

    @objc func removeAlphaButtonTapped() {
        let newAlpha = min(1.0, currentAlpha + 0.1)
        animateAlphaChange(to: newAlpha)
    }
    
    private func animateAlphaChange(to newAlpha: CGFloat) {
        UIView.animate(withDuration: 0.3) {
            self.imageView.alpha = newAlpha
        } completion: { _ in
            self.currentAlpha = newAlpha
        }
    }
    
    private func makeConstraints() {
        imageView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.size.equalTo(Constants.imageViewSize)
        }
        
        stackViewOfButtons.snp.makeConstraints {
            $0.bottom.left.right.equalToSuperview().inset(Constants.insetBetweenButtons)
        }
        
        stackViewOfButtons.arrangedSubviews.forEach { button in
            button.snp.makeConstraints {
                $0.height.equalTo(Constants.buttonSize.height)
            }
        }
    }
}
