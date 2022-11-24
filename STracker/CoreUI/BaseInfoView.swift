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
    
    init(with title: String? = nil, alignment: NSTextAlignment = .left) {
       titleLabel.text = title?.uppercased()
       titleLabel.textAlignment = alignment
       super.init(frame: .zero)
   }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BaseInfoView {
    
    override func addViews() {
        super.addViews()
        addSubview(titleLabel)
        addSubview(contentView)
    }
    
    override func layoutViews() {
        super.layoutViews()
        [titleLabel, contentView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        let contentTopAnchor: NSLayoutAnchor = titleLabel.text == nil ? topAnchor : titleLabel.bottomAnchor
        let contentOffset: CGFloat = titleLabel.text == nil ? 0 : 10
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            contentView.topAnchor.constraint(equalTo: contentTopAnchor, constant: contentOffset),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    override func configureViews() {
        super.configureViews()
        backgroundColor = .clear
        
        titleLabel.font = C.Fonts.helveticaRegular(with: 13)
        titleLabel.textColor = C.Colors.inactive
        
        contentView.backgroundColor = .white
        contentView.layer.borderColor = C.Colors.eliminator.cgColor
        contentView.layer.borderWidth = 1
        contentView.layer.cornerRadius = 5
    }
}
