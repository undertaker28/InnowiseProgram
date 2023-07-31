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
        setupTabBarStyle()
        setupTabBarAppearance()
        setupTabBarTintColor()
    }

    private func setupTabBarStyle() {
        self.tabBar.layer.masksToBounds = true
        self.tabBar.isTranslucent = true
        self.tabBar.layer.cornerRadius = 30
        self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }

    private func setupTabBarAppearance() {
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
        tabBarAppearance.backgroundColor = UIColor(named: "TabBarBlack")
        
        UITabBar.appearance().standardAppearance = tabBarAppearance
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
    }

    private func setupTabBarTintColor() {
        tabBar.tintColor = .white
    }
    
    private func setupViewControllers() {
        let tabTitles = ["1", "2", "3", "4", "5"]
        let rootTitles = ["First Screen", "Second Screen", "Third Screen", "Fourth Screen", "Fifth Screen"]
        
        var controllers: [UIViewController] = []
        for (index, tabTitle) in tabTitles.enumerated() {
            let rootTitle = rootTitles[index]
            let viewController: UIViewController
            
            switch index {
            case 0:
                viewController = FirstListOfUsersViewController()
            case 1:
                viewController = SecondListOfUsersViewController()
            case 2:
                viewController = ThirdGridCollectionViewController()
            case 3:
                viewController = FourthMosaicCollectionViewController()
            case 4:
                viewController = FifthListOfUsersViewController()
            default:
                viewController = UIViewController()
            }
            
            let navigationController = createNavigationController(for: viewController, tabTitle: tabTitle, rootTitle: rootTitle)
            controllers.append(navigationController)
        }
        
        viewControllers = controllers
    }
    
    private func createNavigationController(for rootViewController: UIViewController, tabTitle: String, rootTitle: String) -> UIViewController {
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.tabBarItem.title = tabTitle
        navigationController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = rootTitle
        return navigationController
    }
}
