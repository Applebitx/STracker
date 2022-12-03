//
//  BaseInfoView.swift
//  STracker
//
//  Created by Денис Сторожик on 23.11.2022.
//

import UIKit

class BaseInfoView: BaseView {

    private let contentView = UIView()
    
    init() {
        super.init(frame: .zero)
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
        addSubview(contentView)
    }
    
    override func layoutViews() {
        super.layoutViews()
        contentView.pinToSuperview()
    }
    
    override func configureViews() {
        super.configureViews()
        
        contentView.backgroundColor = .white
        contentView.layer.borderColor = C.Colors.eliminator.cgColor
        contentView.layer.borderWidth = 1
        contentView.layer.cornerRadius = 5
    }
}
