//
//  File.swift
//  STracker
//
//  Created by Денис Сторожик on 22.11.2022.
//

import UIKit
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
    
    //MARK: pin
    
    func pinToSuperview(offset: CGFloat? = nil) {
        guard let superview = superview else { fatalError("UIView+pinToSuperview: \(description) has no superview.") }
        if let offset = offset {
            pin(to: superview, offset: offset )
        } else {
            pin(to: superview)
        }
    }
    
    func pin(to view: UIView, offset: CGFloat? = nil) {
        self.translatesAutoresizingMaskIntoConstraints = false
        if let offset = offset {
            leftAnchor.constraint(equalTo: view.leftAnchor, constant: offset).isActive = true
            rightAnchor.constraint(equalTo: view.rightAnchor, constant: -offset).isActive = true
            topAnchor.constraint(equalTo: view.topAnchor, constant: offset).isActive = true
            bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -offset).isActive = true
        } else {
            leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
            rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
            topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        }
        
    }
}
