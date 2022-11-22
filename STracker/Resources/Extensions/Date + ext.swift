//
//  Date + ext.swift
//  STracker
//
//  Created by Денис Сторожик on 22.11.2022.
//

import UIKit

extension Date {
    
    var calendar: Calendar {
        return Calendar.current
    }
    var startOfWeek: Date {
        let components = calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self)
        guard let firstDay = calendar.date(from: components) else {return self}
        return calendar.date(byAdding: .day, value: 1, to: firstDay) ?? self
    }
    func dayComing(after: Int) -> Date {
        return calendar.date(byAdding: .day, value: after, to: self) ?? self
    }
    func stripTime() -> Date {
        let components = calendar.dateComponents([.year, .month, .day], from: self)
        return calendar.date(from: components) ?? self
    }
}
