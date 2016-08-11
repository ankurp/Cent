//
//  Range.swift
//  Cent
//
//  Created by Ankur Patel on 6/30/14.
//  Copyright (c) 2014 Encore Dev Labs LLC. All rights reserved.
//

import Foundation
import Dollar

public extension Range {

    /// For each index in the range invoke the callback by passing the item in range
    ///
    /// - parameter callback: The callback function to invoke that take an element
    func eachWithIndex(callback: Element -> Void) {
        for index in self {
            callback(index)
        }
    }

    /// For each index in the range invoke the callback
    ///
    /// - parameter callback: The callback function to invoke
    func each(callback: Void -> Void) {
        self.eachWithIndex { (T) -> () in
            callback()
        }
    }

}

/// Check if ranges are equal
///
/// - parameter left: Range to compare
/// - parameter right: Range to compare
/// - returns: true if they are smae otherwise false
public func ==<T: ForwardIndexType>(left: Range<T>, right: Range<T>) -> Bool {
    return left.startIndex == right.startIndex && left.endIndex == right.endIndex
}
