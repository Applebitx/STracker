//
//  BaseInfoView.swift
//  STracker
//
//  Created by Денис Сторожик on 23.11.2022.
//

import UIKit

class BaseInfoView: BaseView {
    private let titleLabel = UILabel()
    private let contentView = UIView()
    private var button = BaseButton(with: .primary)
    
    init(with title: String? = nil, buttonType: CButtonType? = nil, buttonTitle: String? = nil) {
        super.init(frame: .zero)
        self.titleLabel.text = title?.uppercased()
        if let type = buttonType {
            self.button = BaseButton(with: type)
            self.button.setTitle(buttonTitle, for: .normal)
            titleLabel.textAlignment = .left
        } else {
            self.button.isHidden = true
            titleLabel.textAlignment = .center
        }
        addViews()
        layoutViews()
        configureViews()
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BaseInfoView {
    
   override func addViews() {
        super.addViews()
        [titleLabel,contentView,button].forEach {
            addSubview($0)
        }
    }
    
    override func layoutViews() {
        super.layoutViews()
        [titleLabel, contentView, button].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        let contentTopAnchor: NSLayoutAnchor = titleLabel.text == nil ? topAnchor : titleLabel.bottomAnchor
        let contentOffset: CGFloat = titleLabel.text == nil ? 0 : 10
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            button.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            button.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 100),
            button.heightAnchor.constraint(equalToConstant: 50),
            
            contentView.topAnchor.constraint(equalTo: contentTopAnchor, constant: contentOffset),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    override func configureViews() {
        super.configureViews()
        
        titleLabel.font = C.Fonts.helveticaRegular(with: 13)
        titleLabel.textColor = C.Colors.inactive
        
        contentView.backgroundColor = .white
        contentView.layer.borderColor = C.Colors.eliminator.cgColor
        contentView.layer.borderWidth = 1
        contentView.layer.cornerRadius = 5
    }
}
