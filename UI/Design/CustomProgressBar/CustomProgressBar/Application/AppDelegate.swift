//
//  AppDelegate.swift
//  CustomProgressBar
//
//  Created by Pavel on 28.06.23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.rootViewController = CustomViewController()
        window?.makeKeyAndVisible()
        return true
    }
}