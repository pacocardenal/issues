//
//  Date+Ext.swift
//  issues
//
//  Created by Paco Cardenal on 20/10/21.
//

import Foundation

extension Date {
  
  func convertToMonthYearFormat() -> String {
    let dateFormater = DateFormatter()
    dateFormater.dateFormat = "MMM-dd-yyyy"
    return dateFormater.string(from: self)
  }
  
}
