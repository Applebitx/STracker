//
//  StepsView.swift
//  STracker
//
//  Created by Денис Сторожик on 14.12.2022.
//

import UIKit

final class StepsView: BaseInfoView {
    
//    private var mockData: [BaseBarView.Data]  = {
//        var temp: [BaseBarView.Data] = []
//        for _ in 1...7 {
//            let data = BaseBarView.Data(value: "\(String(describing: (1...9).randomElement()))k", title: "12/2", heightMultiplier: Double((0...1).randomElement()!))
//            temp.append(data)
//        }
//        return temp
//    }()
//
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
