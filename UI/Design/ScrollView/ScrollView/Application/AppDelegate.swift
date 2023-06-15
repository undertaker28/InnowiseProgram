//
//  AppDelegate.swift
//  ScrollView
//
//  Created by Pavel on 15.06.23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.rootViewController = ScrollViewController()
        window?.makeKeyAndVisible()
        return true
    }
}
