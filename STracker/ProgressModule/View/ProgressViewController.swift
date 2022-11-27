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
        configureViews()

    }
    
    override func configureViews() {
        super.configureViews()
        title = "Progress"
        navigationController?.tabBarItem.title = C.Strings.progress
        addNavBarButton(position: .left, title: C.Strings.progressLeft)
        addNavBarButton(position: .right, title: C.Strings.progressRight)
    }
}
