//
//  TabBarViewController.swift
//  WorkWithLists
//
//  Created by Pavel on 2.07.23.
//

import UIKit

final class TabBarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        setupViewControllers()
    }
    
    private func setupTabBar() {
        let font = UIFont(name: "MarkPro-Bold", size: 24)
        let textAttributes = [NSAttributedString.Key.font: font as Any]
        
        let tabBarItemAppearance = UITabBarItemAppearance()
        tabBarItemAppearance.normal.titleTextAttributes = textAttributes
        tabBarItemAppearance.selected.titleTextAttributes = textAttributes
        
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        tabBarAppearance.inlineLayoutAppearance = tabBarItemAppearance
        tabBarAppearance.stackedLayoutAppearance = tabBarItemAppearance
        tabBarAppearance.compactInlineLayoutAppearance = tabBarItemAppearance
        
        UITabBar.appearance().standardAppearance = tabBarAppearance
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        
        tabBar.tintColor = UIColor(named: "Green")
    }
    
    private func setupViewControllers() {
        let tabTitles = ["1", "2", "3", "4", "5"]
        let rootTitles = ["First", "Second", "Third", "Fourth", "Fifth"]
        
        viewControllers = tabTitles.enumerated().map { index, tabTitle in
            let rootTitle = rootTitles[index]
            return createNavigationController(for: ViewController(), tabTitle: tabTitle, rootTitle: rootTitle)
        }
    }
    
    private func createNavigationController(for rootViewController: UIViewController, tabTitle: String, rootTitle: String) -> UIViewController {
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.tabBarItem.title = tabTitle
        navigationController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = rootTitle
        return navigationController
    }
}
