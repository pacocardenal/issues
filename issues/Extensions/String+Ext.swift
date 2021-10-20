//
//  String+Ext.swift
//  issues
//
//  Created by Paco Cardenal on 20/10/21.
//

import Foundation

extension String {
  
  func convertToDate() -> Date? {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
    dateFormatter.locale = .current
    dateFormatter.timeZone = .current
    
    return dateFormatter.date(from: self)
  }
  
  func convertToDisplayFormat() -> String {
    guard let date = self.convertToDate() else { return "N/A" }
    return date.convertToMonthYearFormat()
  }
  
}
