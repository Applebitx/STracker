//
//  ViewController.swift
//  STracker
//
//  Created by Денис Сторожик on 11.11.2022.
//

import UIKit

class OverviewController: BaseViewController {
    
    private let overviewNavBar = OverviewNavBar()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    override func configure() {
        super.configure()
        navigationController?.navigationBar.isHidden = true
    }
    
    override func addViews() {
        view.addSubview(overviewNavBar)
    }
    
    override func layoutViews() {
        overviewNavBar.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            overviewNavBar.widthAnchor.constraint(equalTo: view.widthAnchor),
            overviewNavBar.topAnchor.constraint(equalTo: view.topAnchor),
            overviewNavBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            overviewNavBar.heightAnchor.constraint(equalToConstant: 143)
        ])
    }
}
