//
//  SceneDelegate.swift
//  ApplicationLifecycle
//
//  Created by Pavel on 30.06.23.
//

import UIKit
import os.log

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    private let logger = Logger(subsystem: Bundle.main.bundleIdentifier!, category: "ApplicationLifecycle")
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }
        
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = ViewController()
        window?.makeKeyAndVisible()
        
        logger.log("SceneDelegate: Scene will connect to session.")
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        logger.log("SceneDelegate: Scene did disconnect.")
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        logger.log("SceneDelegate: Scene did become active.")
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        logger.log("SceneDelegate: Scene will resign active.")
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        logger.log("SceneDelegate: Scene will enter foreground.")
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        logger.log("SceneDelegate: Scene did enter background.")
    }
}
