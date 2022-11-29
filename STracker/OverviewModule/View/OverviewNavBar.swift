//
//  OverviewNavBar.swift
//  STracker
//
//  Created by Денис Сторожик on 17.11.2022.
//

import UIKit

final class OverviewNavBar: BaseView {
    
    private let workoutsButton = BaseButton(with: .workouts)
    private let addButton = UIButton()
    private let titleLabel = UILabel()
    private let weekView = WeekView()
    
}

extension OverviewNavBar {
    
    override func addViews() {
        super.addViews()
        
        [workoutsButton, addButton, titleLabel, weekView].forEach {
            addSubview($0)
        }
        
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        [workoutsButton, addButton, titleLabel, weekView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
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
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            
            weekView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            weekView.trailingAnchor.constraint(equalTo: addButton.trailingAnchor),
            weekView.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 5),
            weekView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
            ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addBottomBorder(with: C.Colors.eliminator, height: 1)
    }
    
    override func configureViews() {
        super.configureViews()
        backgroundColor = .white
        
        workoutsButton.addTarget(self, action: #selector(workoutsButtonAction), for: .touchUpInside)
        workoutsButton.setTitle(C.Strings.Overview.workoutsButton)
        
        titleLabel.text = C.Strings.Overview.today
        titleLabel.font = C.Fonts.helveticaBold(with: 22)
        titleLabel.textColor = C.Colors.darkGray
        
        addButton.setImage(C.Icons.addButton, for: .normal)
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
