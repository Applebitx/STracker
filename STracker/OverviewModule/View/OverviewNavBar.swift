//
//  OverviewNavBar.swift
//  STracker
//
//  Created by Денис Сторожик on 17.11.2022.
//

import UIKit

final class OverviewNavBar: BaseView {
    
    private let workoutsButton = WorkoutsButton()
    private let addButton = UIButton()
    private let titleLabel = UILabel()
    
}

extension OverviewNavBar {
    
    override func addViews() {
        super.addViews()
        addSubview(workoutsButton)
        addSubview(addButton)
        addSubview(titleLabel)
    }
    
    override func layoutViews() {
        super.layoutViews()
        workoutsButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            addButton.heightAnchor.constraint(equalToConstant: 28),
            addButton.widthAnchor.constraint(equalTo: addButton.heightAnchor),
            addButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            
            workoutsButton.widthAnchor.constraint(equalToConstant: 130),
            workoutsButton.heightAnchor.constraint(equalToConstant: 28),
            workoutsButton.trailingAnchor.constraint(equalTo: addButton.leadingAnchor, constant: -15),
            workoutsButton.topAnchor.constraint(equalTo: addButton.topAnchor ),
            
            titleLabel.centerYAnchor.constraint(equalTo: addButton.centerYAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: workoutsButton.leadingAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15)
        ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addBottomBorder(with: Constants.Colors.eliminator, height: 1)
    }
    
    override func configure() {
        super.configure()
        backgroundColor = .white
        
        workoutsButton.setTitle(Constants.Strings.workoutsButton)
        workoutsButton.addTarget(self, action: #selector(workoutsButtonAction), for: .touchUpInside)
        
        titleLabel.text = Constants.Strings.today
        titleLabel.font = Constants.Fonts.helveticaRegular(with: 22)
        titleLabel.textColor = Constants.Colors.darkGray
        
        addButton.setImage(Constants.Icons.addButton, for: .normal)
        addButton.addTarget(self, action: #selector(addButtonDidPressed), for: .touchUpInside)
        addButton.layer.cornerRadius = 14
    }
}

@objc extension OverviewNavBar {
    
    func workoutsButtonAction() {
        print("WB is pressed")
    }
    
    func addButtonDidPressed() {
        print()
    }
}
