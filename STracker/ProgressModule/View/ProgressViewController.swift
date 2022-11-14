//
//  ProgressViewController.swift
//  STracker
//
//  Created by Денис Сторожик on 14.11.2022.
//

import UIKit

class ProgressViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()

    }
    
    override func configure() {
        super.configure()
        title = "Progress"
        navigationController?.tabBarItem.title = Constants.Strings.progress
        addNavBarButton(position: .left, title: Constants.Strings.progressLeft)
        addNavBarButton(position: .right, title: Constants.Strings.progressRight)
    }
}
