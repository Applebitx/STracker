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

@objc extension BaseViewController {
    func addViews() {}
    func layoutViews() {}
    func configureViews() {
        view.backgroundColor = C.Colors.background
    }
    
    func navBarLeftButtonHandler() {}
    
    func navBarRightButtonHandler() {}
}

extension BaseViewController {
    
    func addNavBarButton(position: NavBarPosition, title: String) {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(C.Colors.active, for: .normal)
        button.setTitleColor(C.Colors.inactive, for: .disabled)
        button.titleLabel?.font = C.Fonts.helveticaRegular(with: 17)
        
        switch position {
        case .left:
            button.addTarget(self, action: #selector(navBarLeftButtonHandler), for: .touchUpInside)
            navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        default:
            button.addTarget(self, action: #selector(navBarRightButtonHandler), for: .touchUpInside)
            navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
        }
    }
    
    func addNavBarButtonTitle(position: NavBarPosition, title: String ) {
        switch position {
        case .left:
            (navigationItem.leftBarButtonItem?.customView as? UIButton)?.setTitle(title, for: .normal)
        default:
            (navigationItem.rightBarButtonItem?.customView as? UIButton)?.setTitle(title, for: .normal)
        }
    }
}


enum NavBarPosition {
    case left
    case right
}
