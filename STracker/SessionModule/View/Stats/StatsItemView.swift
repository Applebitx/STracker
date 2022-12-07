//
//  StatsVIew.swift
//  STracker
//
//  Created by Денис Сторожик on 03.12.2022.
//

import UIKit

enum StatsItem {
    case heartRate(value: String)
    case steps(value: String)
    case speed(value: String)
    case totalDistance(value: String)
    
    var data: Item {
        switch self {
        case .heartRate(let value):
            return .init(image: C.Icons.heartRate, value: "\(value) bpm", title: C.Strings.Session.heartRate)
        case .steps(let value):
            return .init(image: C.Icons.steps, value: value, title: C.Strings.Session.steps)
        case .speed(let value):
            return .init(image: C.Icons.speed, value: "\(value) / km", title: C.Strings.Session.speed)
        case .totalDistance(let value):
            return .init(image: C.Icons.totalDistance, value: "\(value) km", title: C.Strings.Session.totalDistance)
        }
    }
}

final class StatsItemView: BaseView {
    
    private let imageView = UIImageView()
    
    private let valueLabel: UILabel = {
        let label = UILabel(position: .left, size: 17, color: C.Colors.darkGray)
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel(position: .left, size: 10, color: C.Colors.inactive)
        return label
    }()
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 6
        return stack
    }()
    
    func configure(with item: StatsItem) {
        self.imageView.image = item.data.image
        self.titleLabel.text = item.data.title
        self.valueLabel.text = item.data.value
    }
}

extension StatsItemView {
    
    override func addViews() {
        super.addViews()
        
        addSubview(imageView)
        addSubview(stackView)
        
        [valueLabel, titleLabel].forEach {
            stackView.addArrangedSubview($0)
        }
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        [imageView, stackView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 23),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor),
            
            stackView.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 15),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
