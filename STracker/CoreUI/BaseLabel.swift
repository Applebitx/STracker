//
//  BaseLabel.swift
//  STracker
//
//  Created by Денис Сторожик on 28.11.2022.
//

import UIKit

class BaseLabel: UILabel {
    

    init(with text: String,  position: NSTextAlignment) {
        super.init(frame: .zero)
        self.text = text.uppercased()
        self.textAlignment = position
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BaseLabel {
   
    func configure() {
        self.font = C.Fonts.helveticaRegular(with: 13)
        self.textColor = C.Colors.inactive
    }
}
