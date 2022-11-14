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
        configure()
        
    }
    
    override func configure() {
        super.configure()
        title = "Session"
        navigationController?.tabBarItem.title = Constants.TabBar.session
    }
}
