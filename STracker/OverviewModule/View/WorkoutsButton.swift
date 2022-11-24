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
    
    func setTitle(_ title: String) {
        self.label.text = title
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
        label.textColor = C.Colors.active
        label.font = C.Fonts.helveticaRegular(with: 15)
        label.textAlignment = .center
        
        iconView.translatesAutoresizingMaskIntoConstraints = false
        iconView.image = C.Icons.arrowDown?.withRenderingMode(.alwaysTemplate)
        iconView.tintColor = C.Colors.active
        
        backgroundColor = C.Colors.lightBlue
        layer.cornerRadius = 14
        addSystemEffect(self)
        
        
    }
}
