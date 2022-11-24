//
//  SessionControllerViewController.swift
//  STracker
//
//  Created by Денис Сторожик on 14.11.2022.
//

import UIKit

class SessionViewController: BaseViewController {
    
    private var timerView = BaseInfoView(with: nil, alignment: .center)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        
    }
}

extension SessionViewController {
        
    override func addViews() {
        super.addViews()
        view.addSubview(timerView)
    }
    
    override func layoutViews() {
        timerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            timerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            timerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            timerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            timerView.heightAnchor.constraint(equalToConstant: 317)
            
        ])
    }
    
    
    override func configureViews() {
        super.configureViews()
        title = C.Strings.session
        navigationController?.tabBarItem.title = C.Strings.session
        addNavBarButton(position: .left, title: C.Strings.sessionLeft)
        addNavBarButton(position: .right, title: C.Strings.sessionRight)
    }
}

