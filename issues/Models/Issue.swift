//
//  Issue.swift
//  issues
//
//  Created by Paco Cardenal on 13/10/21.
//

import Foundation

struct Issue: Hashable {
  
  // MARK: - Properties
  let _id: String?
  let firstName: String?
  let lastName: String?
  let issueCount: Int?
  let dateOfBirth: String?
  
  var fullName: String? {
    "\(firstName ?? "") \(lastName ?? "")"
  }
  
  // MARK: - Initializers
  init?(row : [String]) {
    guard row.count == 4, let issues = Int(row[2]) else { return nil }
    
    self.firstName = row[0]
    self.lastName = row[1]
    self.issueCount = issues
    self.dateOfBirth = row[3]
    self._id = nil
  }
}

// MARK: - Extension CustomStringConvertible
extension Issue: CustomStringConvertible {
  var description: String {
    return """
      
      First name: \(firstName ?? "no first name")
      Last name: \(lastName ?? "no last  name")
      Issue count: \(issueCount ?? -1)
      Date of birth: \(dateOfBirth ?? "no date of birth")
      
      """
  }
}
