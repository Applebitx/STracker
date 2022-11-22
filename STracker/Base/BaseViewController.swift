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
        addViews()
        layoutViews()
        configureViews()
    }
}

@objc extension BaseViewController: UIBaseMethods {
    func addViews() {}
    func layoutViews() {}
    func configureViews() {
        view.backgroundColor = Constants.Colors.background
    }
    
    func navBarLeftButtonHandler() {}
    
    func navBarRightButtonHandler() {}
}

extension BaseViewController {
    
    func addNavBarButton(position: NavBarPosition, title: String) {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(Constants.Colors.active, for: .normal)
        button.setTitleColor(Constants.Colors.inactive, for: .disabled)
        button.titleLabel?.font = Constants.Fonts.helveticaRegular(with: 17)
        
        switch position {
        case .left:
            button.addTarget(self, action: #selector(navBarLeftButtonHandler), for: .touchUpInside)
            navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        default:
            button.addTarget(self, action: #selector(navBarRightButtonHandler), for: .touchUpInside)
            navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
        }
        
    }
}


enum NavBarPosition {
    case left
    case right
}
