//
//  Constants.swift
//  STracker
//
//  Created by Денис Сторожик on 11.11.2022.
//

import UIKit

struct C {
   
    struct Colors {
        static let active = UIColor.hexStringToUIColor(hex: "#437BFE")
        static let inactive = UIColor.hexStringToUIColor(hex: "#929DA5")
        static let separator = UIColor.hexStringToUIColor(hex: "#929DA5")
        static let eliminator = UIColor.hexStringToUIColor(hex: "E8ECEF")
        static let darkGray = UIColor.hexStringToUIColor(hex: "545C77")
        static let background = UIColor.hexStringToUIColor(hex: "#F8F9F9")
        static let lightBlue = UIColor.hexStringToUIColor(hex: "F0F3FF")
    }
    
    struct Icons {
        static let home = UIImage(systemName: "house")
        static let session = UIImage(systemName: "alarm")
        static let progress = UIImage(systemName: "chart.bar")
        static let arrowDown = UIImage(systemName: "chevron.compact.down")
        static let addButton = UIImage(named:"add")?.withTintColor(C.Colors.active)
    }
    
    struct Strings {
        static let overview = "Overview"
        static let progress = "Progress"
        static let progressLeft = "Export"
        static let progressRight = "Details"
       
        struct Session {
            static let sessionPause = "Pause"
            static let sessionFinish = "Finish"
            static let sessionStart = "Start     "
            static let session = "Session"
            static let elapsedTime = "Elapsed Time"
            static let remainTime = "Remain Time"
            static let complited = "COMPLITED"
            static let remaining = "REMAINING"
        }
        
        struct Overview {
            static let workoutsButton = "All Workouts"
            static let today = "Today"
            
        }
    }
    
    struct Fonts {
        static func helveticaRegular(with size: CGFloat) -> UIFont {
            UIFont(name: "Helvetica", size: size) ?? UIFont()
        }
        
        static func helveticaBold(with size: CGFloat) -> UIFont {
            UIFont(name: "Helvetica-Bold", size: size) ?? UIFont()
        }
    }
}
