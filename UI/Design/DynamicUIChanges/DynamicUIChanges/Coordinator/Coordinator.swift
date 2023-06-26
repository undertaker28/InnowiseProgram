//
//  Coordinator.swift
//  DynamicUIChanges
//
//  Created by Pavel on 25.06.23.
//

import UIKit

final class Coordinator {
    private let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let startViewController = StartViewController()
        startViewController.coordinator = self
        navigationController.pushViewController(startViewController, animated: false)
    }

    func navigateToFirstScreen() {
        let firstViewController = FirstViewController()
        navigationController.pushViewController(firstViewController, animated: true)
    }

    func navigateToSecondScreen() {
        let secondViewController = SecondViewController()
        navigationController.pushViewController(secondViewController, animated: true)
    }
    
    func navigateToThirdScreen() {
        let thirdViewController = ThirdViewController()
        navigationController.pushViewController(thirdViewController, animated: true)
    }
}
