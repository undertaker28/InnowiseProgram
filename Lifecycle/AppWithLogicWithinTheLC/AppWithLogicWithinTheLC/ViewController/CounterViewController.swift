//
//  CounterViewController.swift
//  AppWithLogicWithinTheLC
//
//  Created by Pavel on 1.07.23.
//

import UIKit
import SnapKit

final class CounterViewController: UIViewController {
    private lazy var cornerRadius = 0
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemYellow
        view.layer.cornerRadius = CGFloat(cornerRadius)
        return view
    }()
    
    private lazy var cornerRadiusLabel: UILabel = {
        let label = UILabel()
        label.text = "\(cornerRadius)"
        label.textColor = .black
        return label
    }()
    
    private lazy var openUpdateCounterButton: UIButton = {
        let button = UIButton()
        button.setTitle("Tap", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .link
        button.addTarget(self, action: #selector(openUpdateCounterButtonTapped), for: .touchUpInside)
        button.addPressAnimation()
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.add(subviews: containerView)
        containerView.add(subviews: cornerRadiusLabel, openUpdateCounterButton)
        makeConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        openUpdateCounterButton.layer.cornerRadius = openUpdateCounterButton.frame.width / 2
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateCounterView()
    }
    
    @objc private func openUpdateCounterButtonTapped() {
        let updateCounterViewController = UpdateCounterViewController()
        updateCounterViewController.delegate = self
        navigationController?.pushViewController(updateCounterViewController, animated: true)
    }
    
    func updateCornerRadiusWhenAppWillResignActive() {
        cornerRadius += 5
        updateCounterView()
    }
    
    func updateCornerRadiusWhenAppWillEnterForeground() {
        cornerRadius += 2
        updateCounterView()
    }
    
    func saveCornerRadiusWhenAppWillTerminate() {
        UserDefaults.standard.set(cornerRadius, forKey: "cornerRadius")
    }
    
    func updateCornerRadiusWhenAppDidBecomeActive(_ minutesInBackground: Int) {
        cornerRadius -= 2 * minutesInBackground
        updateCounterView()
    }
    
    func initCornerRadiusWhenAppDidFinishLaunching() {
        if let savedCornerRadius = UserDefaults.standard.value(forKey: "cornerRadius") as? Int {
            cornerRadius = savedCornerRadius
        }
        updateCounterView()
    }
    
    private func updateCounterView() {
        cornerRadiusLabel.text = "\(cornerRadius)"
        containerView.layer.cornerRadius = CGFloat(cornerRadius)
    }

    private func makeConstraints() {
        containerView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.left.right.equalToSuperview().inset(Constants.leftAndRightInset)
            $0.height.equalTo(containerView.snp.width)
        }
        
        cornerRadiusLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(Constants.offsetInContainerView)
        }
        
        openUpdateCounterButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-Constants.offsetInContainerView)
            $0.size.equalTo(containerView.snp.width).dividedBy(Constants.divisionFactor)
        }
    }
}

extension CounterViewController: UpdateCornerRadiusDelegate {
    func updateCornerRadius() {
        cornerRadius += 10
    }
}
