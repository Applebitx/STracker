//
//  BaseViewController.swift
//  STracker
//
//  Created by Денис Сторожик on 11.11.2022.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

@objc extension BaseViewController {
    func add(views: [UIView]) {}
    func layoutViews() {}
    func configure() {
        view.backgroundColor = Constants.Colors.background
    }
}
