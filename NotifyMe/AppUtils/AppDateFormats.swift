//
//  AppDateFormats.swift
//  NotifyMe
//
//  Created by Praks on 6/8/20.
//  Copyright © 2020 Praks. All rights reserved.
//

import Foundation
struct AppDateFormat {
    static var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone.current
        formatter.dateFormat = "dd MMM yyyy"
        return formatter
    }

    static var timeFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone.current
        formatter.dateFormat = "hh:mm a"
        return formatter
    }
    
    static var dateFullMonthFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone.current
        formatter.dateFormat = "dd MMMM yyyy"
        return formatter
    }
}
