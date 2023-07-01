//
//  UpdateCounterViewController.swift
//  AppWithLogicWithinTheLC
//
//  Created by Pavel on 1.07.23.
//

import UIKit
import SnapKit

protocol UpdateCornerRadiusDelegate: AnyObject {
    func updateCornerRadius()
}

final class UpdateCounterViewController: UIViewController {
    weak var delegate: UpdateCornerRadiusDelegate?

    private lazy var cancelButton: UIButton = {
        let button = UIButton().createButton(titleName: "Cancel", size: 20)
        button.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var updateButton: UIButton = {
        let button = UIButton().createButton(titleName: "Update", size: 20)
        button.addTarget(self, action: #selector(updateButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var stackViewOfButtons: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [cancelButton, updateButton])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 20
        stackView.distribution = .fillEqually
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.add(subviews: stackViewOfButtons)
        makeConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    @objc private func cancelButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func updateButtonTapped() {
        delegate?.updateCornerRadius()
        navigationController?.popViewController(animated: true)
    }
    
    private func makeConstraints() {
        stackViewOfButtons.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.left.right.equalToSuperview().inset(Constants.leftAndRightInset)
        }
        
        stackViewOfButtons.arrangedSubviews.forEach { button in
            button.snp.makeConstraints {
                $0.height.equalTo(Constants.buttonHeight)
            }
        }
    }
}
