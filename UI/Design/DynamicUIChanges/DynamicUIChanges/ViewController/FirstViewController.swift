//
//  FirstViewController.swift
//  DynamicUIChanges
//
//  Created by Pavel on 25.06.23.
//

import UIKit
import SnapKit

final class FirstViewController: UIViewController {
    private lazy var hiddenLabel: UILabel = {
        let label = UILabel()
        label.text = "Hidden"
        label.font = UIFont(name: "MarkPro-Bold", size: 28)
        label.textColor = .white
        label.isHidden = true
        return label
    }()
    
    private lazy var imageView = UIImageView().createImageView(imageName: "SatoruGojo")

    private lazy var hideButton: UIButton = {
        let button = UIButton().createButton(tagId: nil, titleName: "Hide", size: 20)
        button.addTarget(self, action: #selector(hideButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var showButton: UIButton = {
        let button = UIButton().createButton(tagId: nil, titleName: "Show", size: 20)
        button.addTarget(self, action: #selector(showButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var stackViewOfButtons: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [hideButton, showButton])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 16
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "Black")
        view.add(subviews: imageView, hiddenLabel, stackViewOfButtons)
        makeConstraints()
    }
    
    @objc func hideButtonTapped() {
        imageView.isHidden = true
        hiddenLabel.isHidden = false
    }

    @objc func showButtonTapped() {
        imageView.isHidden = false
        hiddenLabel.isHidden = true
    }
    
    private func makeConstraints() {
        imageView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.size.equalTo(Constants.imageViewSize)
        }
        
        hiddenLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        stackViewOfButtons.snp.makeConstraints {
            $0.bottom.left.right.equalToSuperview().inset(Constants.insetBetweenButtons)
        }
        
        stackViewOfButtons.arrangedSubviews.forEach { button in
            button.snp.makeConstraints {
                $0.height.equalTo(Constants.buttonHeight)
            }
        }
    }
}
