//
//  TimerPercentView.swift
//  STracker
//
//  Created by Денис Сторожик on 03.12.2022.
//

import UIKit

extension TimerView {
    
    final class PercentView: BaseView {
        
        private let percentLabel: UILabel = {
            let lable = UILabel(position: .center, size: 15, color: C.Colors.darkGray)
            return lable
        }()
        
        private let titleLabel = {
            let lable = UILabel(position: .center, size: 10, color: C.Colors.inactive)
            return lable
        }()
        
        private let stackView = UIStackView()
        
        func configure(with title: String, value: Int) {
            titleLabel.text = title
            percentLabel.text = "\(value)%"
        }
    }
}

extension TimerView.PercentView {
    
    override func addViews() {
        super.addViews()
        [percentLabel, titleLabel].forEach {
            stackView.addArrangedSubview($0)
        }
        addSubview(stackView)
    }
    
    override func layoutViews() {
        super.layoutViews()
        stackView.pinToSuperview()
        
    }
    
    override func configureViews() {
        super.configureViews()
        stackView.axis = .vertical
        stackView.spacing = 6
        stackView.distribution = .fillProportionally
        
    }
}
