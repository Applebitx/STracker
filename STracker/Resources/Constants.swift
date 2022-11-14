//
//  Constants.swift
//  STracker
//
//  Created by Денис Сторожик on 11.11.2022.
//

import UIKit

struct Constants {
   
    struct Colors {
        static var active = UIColor.hexStringToUIColor(hex: "#437BFE")
        static var inactive = UIColor.hexStringToUIColor(hex: "#929DA5")
        static var separator = UIColor.hexStringToUIColor(hex: "#929DA5")
        static var eliminator = UIColor.hexStringToUIColor(hex: "E8ECEF")
        static var darkGray = UIColor.hexStringToUIColor(hex: "545C77")
        static var background = UIColor.hexStringToUIColor(hex: "#F8F9F9")
        static var lightBlue = UIColor.hexStringToUIColor(hex: "F0F3FF")
    }
    
    struct Icons {
        static var home = UIImage(systemName: "house")
        static var session = UIImage(systemName: "alarm")
        static var progress = UIImage(systemName: "chart.bar")
        static var arrowDown = UIImage(systemName: "chevron.compact.down")
    }
    
    struct Strings {
        static var overview = "Overview"
        static var session = "Session"
        static var progress = "Progress"
        static var progressLeft = "Export"
        static var progressRight = "Details"
        static var sessionLeft = "Pause"
        static var sessionRight = "Finish"
        static var workoutsButton = "All Workouts"
        
    }
    
    struct Fonts {
        static func helveticaRegular(with size: CGFloat) -> UIFont {
            UIFont(name: "Helvetica", size: size) ?? UIFont()
        }
    }
}