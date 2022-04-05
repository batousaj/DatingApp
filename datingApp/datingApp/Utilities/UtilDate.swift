//
//  UtilDate.swift
//  datingApp
//
//  Created by Thien Vu on 15/01/2022.
//

import Foundation

class UtilitiesDate {
    
    static func getCurrentDateTimeToString() -> String {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "YYYY-MM-dd HH:mm:ss"
        let currentTime = TimeZone.current
        dateFormat.timeZone = currentTime
        let time = dateFormat.string(from: Date.now)
        return time
    }
    
    static func getCurrentDateToString() -> String {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "yyyy-MM-dd"
        let currentTime = TimeZone.current
        dateFormat.timeZone = currentTime
        let time = dateFormat.string(from: Date.now)
        return time
    }
    
    static func getCurrentTimeToString() -> String {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "HH:mm:ss"
        let currentTime = TimeZone.current
        dateFormat.timeZone = currentTime
        let time = dateFormat.string(from: Date.now)
        return time
    }
    
    static func getDateFromTimeInterval() -> Double {
        let time = Date.timeIntervalBetween1970AndReferenceDate
        return time
    }
}
