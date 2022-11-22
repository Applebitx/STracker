//
//  SessionControllerViewController.swift
//  STracker
//
//  Created by Денис Сторожик on 14.11.2022.
//

import UIKit

class SessionViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        
    }
    
    override func configureViews() {
        super.configureViews()
        title = "Session"
        navigationController?.tabBarItem.title = Constants.Strings.session
        addNavBarButton(position: .left, title: Constants.Strings.sessionLeft)
        addNavBarButton(position: .right, title: Constants.Strings.sessionRight)
    }
}

