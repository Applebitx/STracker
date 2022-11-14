//
//  Builder.swift
//  STracker
//
//  Created by Денис Сторожик on 11.11.2022.
//

import UIKit

protocol BuilderProtocol {
    func createTabBar() -> UITabBarController
    func createOverviewModule() -> UIViewController
    func createSessionModule() -> UIViewController
    func createProgressModule() -> UIViewController
}

final class Builder: BuilderProtocol {
    func createTabBar() -> UITabBarController {
        return UITabBarController()
    }
    
    func createOverviewModule() -> UIViewController {
        return UIViewController()
    }
    
    func createSessionModule() -> UIViewController {
        return UIViewController()
    }
    
    func createProgressModule() -> UIViewController {
        return UIViewController()
    }
    

    
}
