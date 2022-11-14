//
//  NavBarController.swift
//  STracker
//
//  Created by Денис Сторожик on 11.11.2022.
//

import UIKit

final class NavBarController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        view.backgroundColor = .white
        navigationBar.isTranslucent = false
        navigationBar.standardAppearance.titleTextAttributes = [ .foregroundColor: Constants.Colors.darkGray, .font: Constants.Fonts.helveticaRegular(with: 17)
        ]
        navigationBar.addBottomBorder(with: Constants.Colors.eliminator, height: 1)
    }
    
}
