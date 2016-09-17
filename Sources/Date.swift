//
//  Date.swift
//  Cent
//
//  Created by Ankur Patel on 6/30/14.
//  Copyright (c) 2014 Encore Dev Labs LLC. All rights reserved.
//

import Foundation

public extension NSDate {

    /// Returns a new Date given the year month and day
    ///
    /// - parameter year:
    /// - parameter month:
    /// - parameter day:
    /// - returns: Date
    public class func from(year: Int, month: Int, day: Int) -> NSDate? {
        //   public init(calendar: Calendar? = default, timeZone: TimeZone? = default, era: Int? = default, year: Int? = default, month: Int? = default, day: Int? = default, hour: Int? = default, minute: Int? = default, second: Int? = default, nanosecond: Int? = default, weekday: Int? = default, weekdayOrdinal: Int? = default, quarter: Int? = default, weekOfMonth: Int? = default, weekOfYear: Int? = default, yearForWeekOfYear: Int? = default)
        let c = DateComponents(calendar: nil, timeZone: nil, era: nil, year: year, month: month, day: day)

        if let gregorian = NSCalendar(identifier: NSCalendar.Identifier.gregorian) {
            return gregorian.date(from: c) as NSDate?
        } else {
            return .none
        }
    }

    /// Returns a new Date given the unix timestamp
    ///
    /// - parameter unix: timestamp
    /// - returns: Date
    public class func from(unix: Double) -> NSDate {
        return NSDate(timeIntervalSince1970: unix)
    }

    /// Parses the date based on the format and return a new Date
    ///
    /// - parameter dateStr: String version of the date
    /// - parameter format: By default it is year month day
    /// - returns: Date
    public class func parse(dateStr: String, format: String = "yyyy-MM-dd") -> NSDate {
        let dateFmt = DateFormatter()
        dateFmt.timeZone = NSTimeZone.default
        dateFmt.dateFormat = format
        dateFmt.calendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.ISO8601) as Calendar!
        return dateFmt.date(from: dateStr)! as NSDate
    }

    /// Returns the unix timestamp of the date passed in or
    /// the current unix timestamp
    ///
    /// - parameter date:
    /// - returns: Double
    public class func unix(date: NSDate = NSDate()) -> Double {
       return date.timeIntervalSince1970 as Double
    }
}

public typealias Date = NSDate
