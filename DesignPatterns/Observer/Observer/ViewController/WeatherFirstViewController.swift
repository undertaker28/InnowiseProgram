//
//  WeatherFirstViewController.swift
//  Observer
//
//  Created by Pavel on 21.06.23.
//

import UIKit
import SnapKit

final class WeatherFirstViewController: UIViewController {
    var coordinator: Coordinator?
    
    private lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Next", for: .normal)
        button.titleLabel?.font = UIFont(name: "MarkPro-Bold", size: 16)
        button.tintColor = .white
        button.backgroundColor = .black
        button.layer.cornerRadius = 22
        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        button.addPressAnimation()
        return button
    }()
    
    private lazy var weatherLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "MarkPro-Bold", size: 22)
        label.textColor = .white
        label.text = "Weather:"
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        view.add(subviews: weatherLabel, nextButton)
        makeConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        WeatherObserver.shared.subscribe(self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        WeatherObserver.shared.unsubscribe(self)
    }

    @objc func nextButtonTapped() {
        coordinator?.navigateToSecondScreen()
    }
    
    private func makeConstraints() {
        weatherLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
        
        nextButton.snp.makeConstraints {
            $0.top.equalTo(weatherLabel.snp.bottom).offset(Constants.nextButtonOffsetFromWeatherLabel)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(Constants.nextButtonWidth)
            $0.height.equalTo(Constants.nextButtonHeight)
        }
    }
}

extension WeatherFirstViewController: WeatherSubscriber {
    func updateWeather(_ weather: Int) {
        weatherLabel.text = "Weather: \(weather) °C"
    }
}
