//
//  AppDelegate.swift
//  ReadyScreenLayout
//
//  Created by Pavel on 18.06.23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.rootViewController = UINavigationController(rootViewController: ReadyScreenLayoutController())
        window?.makeKeyAndVisible()
        return true
    }
}
