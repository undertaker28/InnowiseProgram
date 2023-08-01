//
//  AppDelegate.swift
//  Chronometer
//
//  Created by Pavel on 1.08.23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.rootViewController = ChronometerViewController()
        window?.makeKeyAndVisible()
        return true
    }
}
