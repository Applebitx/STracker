//
//  StatsView.swift
//  STracker
//
//  Created by Денис Сторожик on 04.12.2022.
//

import UIKit

final class StatsView: BaseInfoView {
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 5
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        return stack
    }()
    
    func configure(with items: [StatsItem]) {
        items.forEach {
            let view = StatsItemView()
            view.configure(with: $0)
            self.stackView.addArrangedSubview(view)
        }
    }
}

extension StatsView {
    
    override func addViews() {
        super.addViews()
        addSubview(stackView)
        
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            stackView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.75)
            ])
    }
}
