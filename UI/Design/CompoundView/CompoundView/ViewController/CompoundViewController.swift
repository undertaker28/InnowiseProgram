//
//  CompoundViewController.swift
//  CompoundView
//
//  Created by Pavel on 27.06.23.
//

import UIKit
import SnapKit

final class CompoundViewController: UIViewController {
    private let colors: [UIColor] = [.red, .blue, .green, .yellow, .orange, .purple, .cyan, .magenta, .brown, .gray]
    private var currentIndex = 0
    
    private lazy var colorView: UIView = {
        let view = UIView()
        view.backgroundColor = colors[currentIndex]
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var previousButton: UIButton = {
        let button = UIButton().createButton(titleName: "Previous", size: 17)
        button.addTarget(self, action: #selector(previousButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var indexLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "MarkPro-Bold", size: 22)
        label.text = "\(currentIndex)"
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()

    private lazy var nextButton: UIButton = {
        let button = UIButton().createButton(titleName: "Next", size: 17)
        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var stackViewOfButtonsAndLabel: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [previousButton, indexLabel, nextButton])
        stackView.axis = .horizontal
        stackView.spacing = 12
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.add(subviews: colorView, stackViewOfButtonsAndLabel)
        makeConstraints()
    }
    
    @objc private func previousButtonTapped() {
        currentIndex = (currentIndex - 1 + colors.count) % colors.count
        colorView.backgroundColor = colors[currentIndex]
        indexLabel.text = "\(currentIndex)"
    }
    
    @objc private func nextButtonTapped() {
        currentIndex = (currentIndex + 1) % colors.count
        colorView.backgroundColor = colors[currentIndex]
        indexLabel.text = "\(currentIndex)"
    }

    private func makeConstraints() {
        colorView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.height.equalTo(Constants.colorViewHeight)
            $0.left.right.equalToSuperview().inset(Constants.colorViewInset)
        }
        
        stackViewOfButtonsAndLabel.snp.makeConstraints {
            $0.top.equalTo(colorView.snp.bottom).offset(Constants.stackViewOfButtonsAndLabelOffsetFromColorView)
            $0.left.right.equalToSuperview().inset(Constants.stackViewOfButtonsAndLabelInset)
            $0.centerX.equalToSuperview()
        }
        
        previousButton.snp.makeConstraints {
            $0.size.equalTo(Constants.buttonSize)
        }
        
        nextButton.snp.makeConstraints {
            $0.size.equalTo(Constants.buttonSize)
        }
    }
}
