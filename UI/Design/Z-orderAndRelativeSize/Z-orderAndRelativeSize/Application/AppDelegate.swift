//
//  AppDelegate.swift
//  Z-orderAndRelativeSize
//
//  Created by Pavel on 16.06.23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.rootViewController = ZOrderAndRelativeSizeController()
        window?.makeKeyAndVisible()
        return true
    }
}
