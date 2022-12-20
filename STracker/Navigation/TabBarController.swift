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
        
    }
    
    private func configure() {
        tabBar.tintColor = C.Colors.active
        tabBar.barTintColor = C.Colors.inactive
        tabBar.backgroundColor = .white
        tabBar.layer.borderColor = C.Colors.eliminator.cgColor
        tabBar.layer.borderWidth = 1
        tabBar.layer.masksToBounds = true
        
        let overviewController =  OverviewController()
        let sessionController = SessionViewController()
        let progressController = ProgressViewController()
        
        
        let overviewNavController = NavBarController(rootViewController: overviewController)
        let sessionNavController = NavBarController(rootViewController: sessionController)
        let progressNavController = NavBarController(rootViewController: progressController)
        
        overviewNavController.tabBarItem = UITabBarItem(title: C.Strings.Overview.overview, image: C.Icons.home, tag: 1)
        sessionNavController.tabBarItem = UITabBarItem(title: C.Strings.Session.session, image: C.Icons.session, tag: 2)
        progressNavController.tabBarItem = UITabBarItem(title: C.Strings.Progress.progress, image: C.Icons.progress, tag: 3)
        
        setViewControllers([overviewNavController, sessionNavController,progressNavController], animated: false)
        self.selectedIndex = 2
    }
}

enum Tabs {
    case overview
    case session
    case progress
}
