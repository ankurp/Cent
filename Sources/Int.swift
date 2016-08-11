//
//  Int.swift
//  Cent
//
//  Created by Ankur Patel on 6/30/14.
//  Copyright (c) 2014 Encore Dev Labs LLC. All rights reserved.
//

import Foundation
import Dollar

public extension Int {

    /// Invoke a callback n times
    ///
    /// - parameter callback: The function to invoke that accepts the index
    public func times(callback: Int -> Void) {
        (0..<self).eachWithIndex { callback($0) }
    }

    /// Invoke a callback n times
    ///
    /// - parameter function: The function to invoke
    public func times(function: Void -> Void) {
        self.times { (index: Int) -> Void in
            function()
        }
    }


    /// Check if it is even
    ///
    /// - returns: Bool whether int is even
    public var isEven: Bool {
        get {
            return self % 2 == 0
        }
    }

    /// Check if it is odd
    ///
    /// - returns: Bool whether int is odd
    public var isOdd: Bool {
        get {
            return self % 2 == 1
        }
    }

    /// Get ASCII character from integer
    ///
    /// - returns: Character represented for the given integer
    public var char: Character {
        get {
            return Character(UnicodeScalar(self))
        }
    }

    /// Splits the int into array of digits
    ///
    /// - returns: Bool whether int is odd
    public func digits() -> [Int] {
        var digits: [Int] = []
        var selfCopy = self
        while selfCopy > 0 {
            digits << (selfCopy % 10)
            selfCopy = (selfCopy / 10)
        }
        return Array(digits.reverse())
    }

    /// Get the next int
    ///
    /// - returns: next int
    public func next() -> Int {
        return self + 1
    }

    /// Get the previous int
    ///
    /// - returns: previous int
    public func prev() -> Int {
        return self - 1
    }

    /// Invoke the callback from int up to and including limit
    ///
    /// - parameter limit: the max value to iterate upto
    /// - parameter callback: to invoke
    public func upTo(limit: Int, callback: Void -> Void) {
        (self...limit).each { callback() }
    }

    /// Invoke the callback from int up to and including limit passing the index
    ///
    /// - parameter limit: the max value to iterate upto
    /// - parameter callback: to invoke
    public func upTo(limit: Int, callback: Int -> Void) {
        (self...limit).eachWithIndex { callback($0) }
    }

    /// Invoke the callback from int down to and including limit
    ///
    /// - parameter limit: the min value to iterate upto
    /// - parameter callback: to invoke
    public func downTo(limit: Int, callback: Void -> Void) {
        var selfCopy = self
        while selfCopy >= limit {
            callback()
            selfCopy -= 1
        }
    }

    /// Invoke the callback from int down to and including limit passing the index
    ///
    /// - parameter limit: the min value to iterate upto
    /// - parameter callback: to invoke
    public func downTo(limit: Int, callback: Int -> Void) {
        var selfCopy = self
        while selfCopy >= limit {
            callback(selfCopy)
            selfCopy -= 1
        }
    }

    /// GCD metod return greatest common denominator with number passed
    ///
    /// - parameter number:
    /// - returns: Greatest common denominator
    public func gcd(number: Int) -> Int {
        return $.gcd(self, number)
    }

    /// LCM method return least common multiple with number passed
    ///
    /// - parameter number:
    /// - returns: Least common multiple
    public func lcm(number: Int) -> Int {
        return $.lcm(self, number)
    }

    /// Returns random number from 0 upto but not including value of integer
    ///
    /// - returns: Random number
    public func random() -> Int {
        return $.random(self)
    }

    /// Returns Factorial of integer
    ///
    /// - returns: factorial
    public func factorial() -> Int {
        return $.factorial(self)
    }

    /// Returns true if i is in closed interval
    ///
    /// - parameter interval: to check in
    /// - returns: true if it is in interval otherwise false
    public func isIn(interval: ClosedInterval<Int>) -> Bool {
        return $.it(self, isIn: interval)
    }

    /// Returns true if i is in half open interval
    ///
    /// - parameter interval: to check in
    /// - returns: true if it is in interval otherwise false
    public func isIn(interval: HalfOpenInterval<Int>) -> Bool {
        return $.it(self, isIn: interval)
    }

    /// Returns true if i is in range
    ///
    /// - parameter interval: to check in
    /// - returns: true if it is in interval otherwise false
    public func isIn(interval: Range<Int>) -> Bool {
        return $.it(self, isIn: interval)
    }

    private func mathForUnit(unit: NSCalendarUnit) -> CalendarMath {
        return CalendarMath(unit: unit, value: self)
    }

    var seconds: CalendarMath {
        return mathForUnit(.Second)
    }

    var second: CalendarMath {
        return seconds
    }

    var minutes: CalendarMath {
        return mathForUnit(.Minute)
    }

    var minute: CalendarMath {
        return minutes
    }

    var hours: CalendarMath {
        return mathForUnit(.Hour)
    }

    var hour: CalendarMath {
        return hours
    }

    var days: CalendarMath {
        return mathForUnit(.Day)
    }

    var day: CalendarMath {
        return days
    }

    var weeks: CalendarMath {
        return mathForUnit(.WeekOfYear)
    }

    var week: CalendarMath {
        return weeks
    }

    var months: CalendarMath {
        return mathForUnit(.Month)
    }

    var month: CalendarMath {
        return months
    }

    var years: CalendarMath {
        return mathForUnit(.Year)
    }

    var year: CalendarMath {
        return years
    }

    struct CalendarMath {
        private let unit: NSCalendarUnit
        private let value: Int
        private var calendar: NSCalendar {
            return NSCalendar.autoupdatingCurrentCalendar()
        }

        private init(unit: NSCalendarUnit, value: Int) {
            self.unit = unit
            self.value = value
        }

        private func generateComponents(modifer: (Int) -> (Int) = (+)) -> NSDateComponents {
            let components = NSDateComponents()
            components.setValue(modifer(value), forComponent: unit)
            return components
        }

        public func from(date: NSDate) -> NSDate? {
            return calendar.dateByAddingComponents(generateComponents(), toDate: date, options: [])
        }

        public var fromNow: NSDate? {
            return from(NSDate())
        }

        public func before(date: NSDate) -> NSDate? {
            return calendar.dateByAddingComponents(generateComponents(-), toDate: date, options: [])
        }

        public var ago: NSDate? {
            return before(NSDate())
        }
    }
}
