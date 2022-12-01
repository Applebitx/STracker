//
//  PrimaryButton.swift
//  STracker
//
//  Created by Денис Сторожик on 24.11.2022.
//

import UIKit

public enum CButtonType {
    case primary
    case workouts
}

class BaseButton: UIButton {
    
    private let label = UILabel()
    private let iconView = UIImageView()
    internal var cButtonType: CButtonType?
    
    init(with type: CButtonType) {
        super.init(frame: .zero)
        self.cButtonType = type
        addViews()
        configure()
        layoutViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(frame: .zero)
        self.cButtonType = .primary
        addViews()
        layoutViews()
        configure()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutViews()
    }
}

@objc extension BaseButton {
   
    func addViews() {
        [label,iconView].forEach {
           addSubview($0)
        }
    }
    
    func layoutViews() {
        [label,iconView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        var horizontalOffset: CGFloat {
            switch cButtonType {
            case .primary: return 0
            default: return 10
            }
        }
        NSLayoutConstraint.activate([
            iconView.widthAnchor.constraint(equalToConstant: 10),
            iconView.heightAnchor.constraint(equalToConstant: 5),
            iconView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -horizontalOffset),
            iconView.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.trailingAnchor.constraint(equalTo: iconView.leadingAnchor, constant: -5),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: horizontalOffset),
            label.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func configure() {
        
        iconView.image = C.Icons.arrowDown?.withRenderingMode(.alwaysTemplate)
        addSystemEffect(self)
        
        switch cButtonType {
        case .primary:
            label.textAlignment = .right
            backgroundColor = .clear
            label.textColor = C.Colors.inactive
            iconView.tintColor = C.Colors.inactive
            label.font = C.Fonts.helveticaRegular(with: 14)
        default:
            backgroundColor = C.Colors.lightBlue
            label.font = C.Fonts.helveticaRegular(with: 15)
            label.textAlignment = .center
            label.textColor = C.Colors.active
            iconView.tintColor = C.Colors.active
            layer.cornerRadius = 14
        }
        
    }
    
    func addButtonTarget(target: Any, action: Selector) {
        addTarget(target, action: action, for: .touchUpInside)
    }
    
    func setTitle(_ title: String) {
        self.label.text = cButtonType == .primary ? title.uppercased() : title
    }

}
