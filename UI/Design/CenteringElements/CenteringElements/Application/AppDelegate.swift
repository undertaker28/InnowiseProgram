//
//  AppDelegate.swift
//  CenteringElements
//
//  Created by Pavel on 13.06.23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.rootViewController = CenteringElementsController()
        window?.makeKeyAndVisible()
        return true
    }
}
