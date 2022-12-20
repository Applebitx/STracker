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
        static let heartRate = UIImage(named:"HeartBeat")?.withTintColor(C.Colors.inactive)
        static let speed = UIImage(named:"Speed")?.withTintColor(C.Colors.inactive)
        static let steps = UIImage(named:"Steps")?.withTintColor(C.Colors.inactive)
        static let totalDistance = UIImage(named:"Maps")?.withTintColor(C.Colors.inactive)
    }
    
    struct Strings {
        
        struct Overview {
            static let workoutsButton = "All Workouts"
            static let today = "Today"
            static let overview = "Overview"
        }
        
        struct Session {
            static let sessionPause = "Pause"
            static let sessionFinish = "Finish"
            static let sessionStart = "Start     "
            static let session = "Session"
            static let elapsedTime = "Elapsed Time"
            static let remainTime = "Remain Time"
            static let complited = "COMPLITED"
            static let remaining = "REMAINING"
            static let speed = "AVERAGE PACE"
            static let steps = "TOTAL STEPS"
            static let totalDistance = "TOTAL DISTANCE"
            static let heartRate = "HEART RATE"
            static let workoutsLabel = "WORKOUTS STATS"
            static let stepsLabel = "STEPS COUNTER"
        }
        
        struct Progress {
            static let progress = "Progress"
            static let progressLeft = "Export"
            static let progressRight = "Details"
            static let daily = "DAILY PERFORMANCE"
            static let mounthly = "MOUNTHLY PERFORMANCE"
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
