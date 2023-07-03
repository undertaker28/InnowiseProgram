//
//  StartViewController.swift
//  DynamicUIChanges
//
//  Created by Pavel on 25.06.23.
//

import UIKit
import SnapKit

final class StartViewController: UIViewController {
    var coordinator: Coordinator?
    
    private lazy var firstOpenScreenButton: UIButton = {
        let button = UIButton().createButton(tagId: 1, titleName: "First Screen", size: 16)
        button.addTarget(self, action: #selector(openScreenButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var secondOpenScreenButton: UIButton = {
        let button = UIButton().createButton(tagId: 2, titleName: "Second Screen", size: 16)
        button.addTarget(self, action: #selector(openScreenButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var thirdOpenScreenButton: UIButton = {
        let button = UIButton().createButton(tagId: 3, titleName: "Third Screen", size: 16)
        button.addTarget(self, action: #selector(openScreenButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [firstOpenScreenButton, secondOpenScreenButton, thirdOpenScreenButton])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 25
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "Black")
        view.add(subviews: stackView)
        makeConstraints()
    }
    
    @objc func openScreenButton(_ sender: UIButton) {
        let button = sender.self
        switch button.tag {
        case 1:
            coordinator?.navigateToFirstScreen()
        case 2:
            coordinator?.navigateToSecondScreen()
        default:
            coordinator?.navigateToThirdScreen()
        }
    }
    
    private func makeConstraints() {
        stackView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        stackView.arrangedSubviews.forEach { button in
            button.snp.makeConstraints {
                $0.size.equalTo(Constants.buttonSize)
            }
        }
    }
}
