//
//  Range.swift
//  Cent
//
//  Created by Ankur Patel on 6/30/14.
//  Copyright (c) 2014 Encore Dev Labs LLC. All rights reserved.
//

import Foundation
import Dollar


/// Check if ranges are equal
///
/// - parameter left: Range to compare
/// - parameter right: Range to compare
/// - returns: true if they are smae otherwise false
public func ==<T: Comparable>(left: Range<T>, right: Range<T>) -> Bool {
    return left.lowerBound == right.lowerBound && left.upperBound == right.upperBound
}
