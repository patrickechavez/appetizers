//
//  Date+Ext.swift
//  Appetizers
//
//  Created by John Patrick Echavez on 6/3/25.
//

import Foundation

extension Date {
 
    var eighteenYearsAgo: Date {
        Calendar.current.date(byAdding: .year, value: -18, to: self)!
    }
    
    var oneHundredTenYearsAgo: Date {
        Calendar.current.date(byAdding: .year, value: -110, to: self)!
    }
}
