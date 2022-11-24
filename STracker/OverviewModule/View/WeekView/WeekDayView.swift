//
//  WeekDayView.swift
//  STracker
//
//  Created by Денис Сторожик on 22.11.2022.
//

import UIKit

extension WeekView {
    class WeekDayView: BaseView {
        private let nameLabel = UILabel()
        private let dateLabel = UILabel()
        private let subStackView = UIStackView()
        
        func configure(with index: Int, name: String) {
            
            let startOfWeek = Date().startOfWeek
            let currentDay = startOfWeek.dayComing(after: index)
            let day = Date().calendar.component(.day, from: currentDay)
            
            let isToday = currentDay.stripTime() == Date().stripTime()
            
            backgroundColor = isToday ? C.Colors.active : C.Colors.background
            nameLabel.textColor = isToday ? .white : C.Colors.inactive
            dateLabel.textColor = isToday ? .white : C.Colors.inactive
            nameLabel.text = name.uppercased()
            dateLabel.text = ("\(day)")
        }
    }
}

extension WeekView.WeekDayView {
    
    override func addViews() {
        super.addViews()
        addSubview(subStackView)
        subStackView.addArrangedSubview(nameLabel)
        subStackView.addArrangedSubview(dateLabel)
    }
    override func layoutViews() {
        super.layoutViews()
        subStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            subStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            subStackView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    override func configureViews() {
        super.configureViews()
        layer.cornerRadius = 10
        layer.masksToBounds = true
        
        subStackView.spacing = 1
        subStackView.axis = .vertical
        subStackView.alignment = .center
        backgroundColor = C.Colors.background
        
        nameLabel.font = C.Fonts.helveticaRegular(with: 9)
        nameLabel.textAlignment = .center
        dateLabel.font = C.Fonts.helveticaRegular(with: 15)
        dateLabel.textAlignment = .center
        
    }
}
