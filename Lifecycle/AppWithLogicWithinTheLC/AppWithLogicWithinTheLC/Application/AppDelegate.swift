//
//  AppDelegate.swift
//  AppWithLogicWithinTheLC
//
//  Created by Pavel on 1.07.23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var viewController: CounterViewController?
    var backgroundTime: Date?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        viewController = CounterViewController()
        window?.rootViewController = UINavigationController(rootViewController: viewController ?? UIViewController())
        window?.makeKeyAndVisible()
        
        viewController?.initCornerRadiusWhenAppDidFinishLaunching()
        
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        viewController?.updateCornerRadiusWhenAppWillResignActive()
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        if let backgroundTime = backgroundTime {
            let minutesInBackground = Int(Date().timeIntervalSince(backgroundTime) / Constants.secondsInMinute)
            viewController?.updateCornerRadiusWhenAppDidBecomeActive(minutesInBackground)
        }
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        backgroundTime = Date()
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        viewController?.updateCornerRadiusWhenAppWillEnterForeground()
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        viewController?.saveCornerRadiusWhenAppWillTerminate()
    }
}
