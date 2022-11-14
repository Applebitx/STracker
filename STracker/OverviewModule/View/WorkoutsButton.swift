//
//  WorkoutsButton.swift
//  STracker
//
//  Created by Денис Сторожик on 14.11.2022.
//

import UIKit

final class WorkoutsButton: UIButton {
    
    
    private let label = UILabel()
    private let iconView = UIImageView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        layoutViews()
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


private extension WorkoutsButton {
    
    func addViews() {
        addSubview(label)
        addSubview(iconView)
    }
    func layoutViews() {
        NSLayoutConstraint.activate([
            iconView.widthAnchor.constraint(equalToConstant: 10),
            iconView.heightAnchor.constraint(equalToConstant: 5),
            iconView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            iconView.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.trailingAnchor.constraint(equalTo: iconView.leadingAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            label.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func configure() {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Constants.Colors.active
        label.font = Constants.Fonts.helveticaRegular(with: 15)
        label.textAlignment = .center
        label.text = Constants.Strings.workoutsButton
        
        iconView.translatesAutoresizingMaskIntoConstraints = false
        iconView.image = Constants.Icons.arrowDown?.withRenderingMode(.alwaysTemplate)
        iconView.tintColor = Constants.Colors.active
        
        backgroundColor = Constants.Colors.lightBlue
        layer.cornerRadius = 14
        
        
    }
}
