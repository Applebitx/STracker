//
//  BaseBarView.swift
//  STracker
//
//  Created by Денис Сторожик on 14.12.2022.
//

import UIKit

extension BaseBarView {
    struct Data {
        let value: String
        let title: String
        let heightMultiplier: Double
    }
}

class BaseBarView: BaseView {
    
    private let heightMultiplier: Double
    
    private let valueLabel: UILabel = {
        let label = UILabel(position: .center, size: 13, color: C.Colors.active)
        return label
    }()
    
    private let barView: UIView = {
        let view = UIView()
        view.backgroundColor = C.Colors.active
        view.layer.cornerRadius = 2.5
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel(position: .center, size: 9, color: C.Colors.inactive)
        return label
    }()
    
    init(data: Data) {
        self.heightMultiplier = data.heightMultiplier
        super.init(frame: .zero)
        self.valueLabel.text = data.value
        self.titleLabel.text = data.title.uppercased()
    }
    
    required init?(coder: NSCoder) {
        self.heightMultiplier = 0
        super.init(frame: .zero)
    }
}

extension BaseBarView {
    
    override func addViews() {
        super.addViews()
        [valueLabel, barView, titleLabel].forEach {
            addSubview($0)
        }
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        [valueLabel, barView, titleLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            barView.centerXAnchor.constraint(equalTo: centerXAnchor),
            barView.widthAnchor.constraint(equalToConstant: 17),
            barView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: self.heightMultiplier * 0.8),
            
            valueLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            valueLabel.bottomAnchor.constraint(equalTo: barView.topAnchor, constant: -5),
            valueLabel.heightAnchor.constraint(equalToConstant: 10),
            
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            titleLabel.topAnchor.constraint(equalTo: barView.bottomAnchor, constant: 10),
            titleLabel.heightAnchor.constraint(equalToConstant: 10)
        ])
    }
}
