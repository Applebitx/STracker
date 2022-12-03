//
//  BaseLabel.swift
//  STracker
//
//  Created by Денис Сторожик on 28.11.2022.
//

import UIKit

extension UILabel {
    
    convenience init(with text: String? = nil,  position: NSTextAlignment, size: CGFloat, color: UIColor) {
        self.init(frame: .zero)
        self.text = text
        self.textAlignment = position
        self.font = C.Fonts.helveticaRegular(with: size)
        self.textColor = color
    }
}
