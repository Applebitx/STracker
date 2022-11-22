//
//  WeekView.swift
//  STracker
//
//  Created by Денис Сторожик on 21.11.2022.
//

import UIKit

class WeekView: BaseView {
    
    private let stackView = UIStackView()
    private let calendar = Calendar.current
    
}

extension WeekView {
    
    override func addViews() {
        super.addViews()
        addSubview(stackView)
    }
    override func layoutViews() {
        super.layoutViews()
        
        stackView.translatesAutoresizingMaskIntoConstraints =  false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
    }
    override func configureViews() {
        super.configureViews()
        stackView.spacing = 7
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        
        var weekDays = Date().calendar.shortStandaloneWeekdaySymbols
        
        if calendar.firstWeekday == 1 {
            let sun = weekDays.remove(at: 0)
            weekDays.append(sun)
        }
        
        weekDays.enumerated().forEach { index, name in
            let view = WeekDayView()
            view.configure(with: index, name: name)
            stackView.addArrangedSubview(view)
        }
    }
}
