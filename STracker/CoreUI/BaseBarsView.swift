//
//  BaseBarsView.swift
//  STracker
//
//  Created by Денис Сторожик on 14.12.2022.
//

import UIKit

class BaseBarsView: BaseView {
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 20
        stack.distribution = .fillEqually
        return stack
    }()
    
    func configure(with data: [BaseBarView.Data]) {
        data.forEach {
            let barView = BaseBarView(data: $0)
            stackView.addArrangedSubview(barView)
        }
    }
}

extension BaseBarsView {
    
    override func addViews() {
        super.addViews()
        
        addSubview(stackView)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        [stackView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        stackView.pinToSuperview()
    }
}
