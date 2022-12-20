//
//  StepsView.swift
//  STracker
//
//  Created by Денис Сторожик on 14.12.2022.
//

import UIKit

final class StepsView: BaseInfoView {
    
    private let barsView: BaseBarsView = {
        let view = BaseBarsView()
        return view
    }()
    
    func configure(with items: [BaseBarView.Data]) {
        self.barsView.configure(with: items)
    }
    
}


extension StepsView {
    
    override func addViews() {
        super.addViews()
        addSubview(barsView)
        
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        barsView.translatesAutoresizingMaskIntoConstraints = false
        barsView.pinToSuperview(offset: 15)
    }
}
