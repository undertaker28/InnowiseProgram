//
//  AppDelegate.swift
//  PipetteAndZ-order
//
//  Created by Pavel on 17.06.23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.rootViewController = PipetteAndZOrderController()
        window?.makeKeyAndVisible()
        return true
    }
}
