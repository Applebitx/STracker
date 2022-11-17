//
//  Helpers.swift
//  STracker
//
//  Created by Денис Сторожик on 11.11.2022.
//

import UIKit

extension UIColor {
    static func hexStringToUIColor(hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
}

extension UIView {
   
    //MARK: Bottom border for navigation controller
    
    func addBottomBorder(with color: UIColor, height: CGFloat) {
        let separator = UIView()
        separator.backgroundColor = color
        separator.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        separator.frame = CGRect(x: 0, y: frame.height - height, width: frame.width, height: height)
        addSubview(separator)
    }
    
    //MARK: System animation of pressing
    
    func addSystemEffect(_ button: UIButton) {
        button.addTarget(self, action: #selector(pressIn), for: [
            .touchDown,
            .touchDragInside
        ])
        
        button.addTarget(self, action: #selector(pressOut), for: [
            .touchUpInside,
            .touchUpOutside,
            .touchDragOutside,
            .touchDragExit,
            .touchCancel
        ])
    }
    
    @objc func pressIn() {
        UIView.animate(withDuration: 0.15) {self.alpha = 0.55}
    }
    
    @objc func pressOut() {
        UIView.animate(withDuration: 0.15) {self.alpha = 1}
    }
}
