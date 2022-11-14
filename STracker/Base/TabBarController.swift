//
//  TabBarControllerViewController.swift
//  STracker
//
//  Created by Денис Сторожик on 11.11.2022.
//

import UIKit

final class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()

        // Do any additional setup after loading the view.
    }
    
    private func configure() {
        tabBar.tintColor = Constants.Colors.active
        tabBar.barTintColor = Constants.Colors.inactive
        tabBar.backgroundColor = .white
        tabBar.layer.borderColor = Constants.Colors.eliminator.cgColor
        tabBar.layer.borderWidth = 1
        tabBar.layer.masksToBounds = true
        
        let overviewController =  OverviewController()
        let sessionController = SessionViewController()
        let progressController = ProgressViewController()
        
        
        let overviewNavController = NavBarController(rootViewController: overviewController)
        let sessionNavController = NavBarController(rootViewController: sessionController)
        let progressNavController = NavBarController(rootViewController: progressController)
        
        overviewNavController.tabBarItem = UITabBarItem(title: Constants.TabBar.overview, image: Constants.Icons.home, tag: 1)
        sessionNavController.tabBarItem = UITabBarItem(title: Constants.TabBar.session, image: Constants.Icons.session, tag: 2)
        progressNavController.tabBarItem = UITabBarItem(title: Constants.TabBar.progress, image: Constants.Icons.progress, tag: 3)
        
        setViewControllers([overviewNavController, sessionNavController,progressNavController], animated: false)
    }
}

enum Tabs {
    case overview
    case session
    case progress
}
