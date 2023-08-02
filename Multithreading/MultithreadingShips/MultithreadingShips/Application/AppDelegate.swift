//
//  AppDelegate.swift
//  MultithreadingShips
//
//  Created by Pavel on 1.08.23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.rootViewController = MainViewController()
        window?.makeKeyAndVisible()
        return true
    }
}
