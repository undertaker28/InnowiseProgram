//
//  SecondViewController.swift
//  DynamicUIChanges
//
//  Created by Pavel on 25.06.23.
//

import UIKit
import SnapKit

final class SecondViewController: UIViewController {
    private lazy var firstImageView = UIImageView().createImageView(imageName: "ErenJaeger")
    
    private lazy var imageViews: [UIImageView] = []

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    private lazy var addViewButton: UIButton = {
        let button = UIButton().createButton(tagId: nil, titleName: "Add", size: 20)
        button.addTarget(self, action: #selector(addViewButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var removeViewButton: UIButton = {
        let button = UIButton().createButton(tagId: nil, titleName: "Remove", size: 20)
        button.addTarget(self, action: #selector(removeViewButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var stackViewOfButtons: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [addViewButton, removeViewButton])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 16
        stackView.distribution = .fillEqually
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "Black")
        addSubviews()
        makeConstraints()
    }

    @objc func addViewButtonTapped() {
        let newImageView = UIImageView().createImageView(imageName: "ErenJaeger")
        imageViews.append(newImageView)
        scrollView.addSubview(newImageView)
        updateImageViewConstraints()
    }

    @objc func removeViewButtonTapped() {
        guard imageViews.count > 1 else {
            return
        }

        imageViews.popLast()?.removeFromSuperview()
        updateImageViewConstraints()
    }
    
    private func updateImageViewConstraints() {
        for (index, imageView) in imageViews.enumerated() {
            imageView.snp.remakeConstraints {
                $0.centerY.equalToSuperview()
                $0.size.equalTo(Constants.imageViewSize)
                
                if index == 0 {
                    $0.center.equalToSuperview()
                } else {
                    $0.left.equalTo(imageViews[index - 1].snp.right).offset(Constants.insetInScrollView)
                }
                
                if index == imageViews.count - 1 {
                    $0.right.equalToSuperview().inset(Constants.insetInScrollView)
                }
            }
        }
    }
    
    private func addSubviews() {
        view.add(subviews: scrollView, stackViewOfButtons)
        imageViews.append(firstImageView)
        scrollView.addSubview(firstImageView)
    }
    
    private func makeConstraints() {
        scrollView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.right.equalToSuperview()
            $0.height.equalTo(Constants.imageViewSize)
        }
        
        firstImageView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.size.equalTo(Constants.imageViewSize)
        }
        
        stackViewOfButtons.snp.makeConstraints {
            $0.left.right.bottom.equalToSuperview().inset(Constants.insetBetweenButtons)
        }
        
        stackViewOfButtons.arrangedSubviews.forEach { button in
            button.snp.makeConstraints {
                $0.height.equalTo(Constants.buttonHeight)
            }
        }
    }
}
