//
//  ViewController.swift
//  STracker
//
//  Created by Денис Сторожик on 11.11.2022.
//

import UIKit

class OverviewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    override func configure() {
        super.configure()
        title = "Overview"
        navigationController?.tabBarItem.title = Constants.TabBar.overview
    }

}

