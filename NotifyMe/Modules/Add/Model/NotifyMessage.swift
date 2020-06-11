//
//  NotifyMessage.swift
//  NotifyMe
//
//  Created by Praks on 6/8/20.
//  Copyright © 2020 Praks. All rights reserved.
//

import Combine
import Foundation

class Message: ObservableObject {
    @Published var title = ""
    @Published var detail = ""
    @Published var date: Date = Date.withZeroSeconds()
    
    init(title: String, detail: String = "", date: Date = Date.withZeroSeconds()) {
        self.title = title
        self.detail = detail
        self.date = date
    }
}

extension Date {
    static func withZeroSeconds() -> Date {
        var dateComponents = DateComponents()
        let userCalendar = Calendar.current
        
        dateComponents.year = userCalendar.component(.year, from: Date())
        dateComponents.month = userCalendar.component(.month, from: Date())
        dateComponents.day = userCalendar.component(.day, from: Date())
        dateComponents.hour = userCalendar.component(.hour, from: Date())
        dateComponents.minute = userCalendar.component(.minute, from: Date())
        dateComponents.second = 0
        dateComponents.nanosecond = 0

        return userCalendar.date(from: dateComponents)!
    }
}
