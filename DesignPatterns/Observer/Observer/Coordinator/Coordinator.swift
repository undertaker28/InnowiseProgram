//
//  Coordinator.swift
//  Observer
//
//  Created by Pavel on 21.06.23.
//

import UIKit

final class Coordinator {
    private let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let weatherFirstViewController = WeatherFirstViewController()
        weatherFirstViewController.coordinator = self
        navigationController.pushViewController(weatherFirstViewController, animated: false)
    }

    func navigateToSecondScreen() {
        let weatherSecondViewController = WeatherSecondViewController()
        weatherSecondViewController.coordinator = self
        navigationController.pushViewController(weatherSecondViewController, animated: true)
    }

    func navigateToThirdScreen() {
        let weatherThirdViewController = WeatherThirdViewController()
        navigationController.pushViewController(weatherThirdViewController, animated: true)
    }
}
