//
//  WeatherThirdViewController.swift
//  Observer
//
//  Created by Pavel on 21.06.23.
//

import UIKit
import SnapKit

final class WeatherThirdViewController: UIViewController {
    private lazy var weatherLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "MarkPro-Bold", size: 22)
        label.textColor = .white
        label.text = "Weather:"
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .link
        view.add(subviews: weatherLabel)
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
    
    private func makeConstraints() {
        weatherLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
    }
}

extension WeatherThirdViewController: WeatherSubscriber {
    func updateWeather(_ weather: Int) {
        weatherLabel.text = "Weather: \(weather) °C"
    }
}
