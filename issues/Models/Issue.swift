//
//  Issue.swift
//  issues
//
//  Created by Paco Cardenal on 13/10/21.
//

import Foundation

struct Issue: Hashable {
  
  // MARK: - Enums
  private enum Constants {
    static let defaultFirstName = ""
    static let defaultLastName = ""
    static let defaultIssuesCount = 0
    static let defaultDateOfBirth = ""
  }
  
  // MARK: - Properties
//  let _id: String? = nil
  let firstName: String?
  let lastName: String?
  let issuesCount: Int?
  let dateOfBirth: String?
  
  var fullName: String? {
    "\(firstName ?? "") \(lastName ?? "")"
  }
  
  // MARK: - Initializers
  init?(row : [String?]) {
    guard row.count == 4 else { return nil }
    
    if let firstName = row[0] {
      self.firstName = firstName
    } else {
      self.firstName = Constants.defaultFirstName
    }
    
    if let lastName = row[1] {
      self.lastName = lastName
    } else {
      self.lastName = Constants.defaultLastName
    }
    
    if let issues = row[2], let issuesCount = Int(issues) {
      self.issuesCount = issuesCount
    } else {
      self.issuesCount = Constants.defaultIssuesCount
    }
    
    if let dateOfBirth = row[3] {
      self.dateOfBirth = dateOfBirth
    } else {
      self.dateOfBirth = Constants.defaultDateOfBirth
    }
    
    if self.firstName == Constants.defaultFirstName &&
        self.lastName == Constants.defaultLastName &&
        self.issuesCount == Constants.defaultIssuesCount &&
        self.dateOfBirth == Constants.defaultDateOfBirth {
      return nil
    }
  }
}

// MARK: - Extension CustomStringConvertible
extension Issue: CustomStringConvertible {
  var description: String {
    return """
      
      First name: \(firstName ?? "no first name")
      Last name: \(lastName ?? "no last  name")
      Issues count: \(issuesCount ?? -1)
      Date of birth: \(dateOfBirth ?? "no date of birth")
      
      """
  }
}
