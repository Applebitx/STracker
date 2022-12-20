//
//  DailyView.swift
//  STracker
//
//  Created by Денис Сторожик on 20.12.2022.
//

import UIKit

final class DailyView: BaseInfoView {
    
    private let dailyView: BaseBarsView = {
        let view = BaseBarsView()
        return view
    }()
    
    func configure(with items: [BaseBarView.Data]) {
        self.dailyView.configure(with: items)
    }
}

extension DailyView {
    
    override func addViews() {
        super.addViews()
        addSubview(dailyView)
        
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        dailyView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dailyView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            dailyView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            dailyView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            dailyView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
}
