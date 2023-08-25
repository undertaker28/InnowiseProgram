//
//  CustomViewController.swift
//  CustomProgressBar
//
//  Created by Pavel on 28.06.23.
//

import UIKit
import SnapKit

final class CustomViewController: UIViewController {
    private lazy var progressBar = CircleProgressBarView()
    
    private lazy var updateProgressButton: UIButton = {
        let button = UIButton()
        button.setTitle("Animate with Random Value", for: .normal)
        button.titleLabel?.font = UIFont(name: "MarkPro-Bold", size: 16)
        button.tintColor = .white
        button.backgroundColor = UIColor(named: "SmaltBlue")
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(updateProgressButtonTapped), for: .touchUpInside)
        button.addPressAnimation()
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.add(subviews: progressBar, updateProgressButton)
        makeConstraints()
    }
    
    @objc private func updateProgressButtonTapped() {
        let randomProgress = CGFloat.random(in: 0...1)
        let roundedProgress = (randomProgress * 100).rounded() / 100
        progressBar.setProgress(roundedProgress)
    }

    private func makeConstraints() {
        progressBar.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.size.equalTo(Constants.progressBarSize)
        }
        
        updateProgressButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(progressBar.snp.bottom).offset(Constants.updateProgressButtonOffsetFromProgressBar)
            $0.size.equalTo(Constants.updateProgressButtonSize)
        }
    }
}
