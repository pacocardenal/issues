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
  let _id = UUID()
  let firstName: String?
  let lastName: String?
  let issuesCount: Int?
  let dateOfBirth: String?
  
  var fullName: String? {
    "\(firstName ?? "") \(lastName ?? "")"
  }
  
}

// MARK: - Extension convenience initializers
extension Issue {
  init?(row : [String?]) {
      guard row.count == 4 else { return nil }
    
    var firstName = Constants.defaultFirstName
    var lastName = Constants.defaultLastName
    var issuesCount = Constants.defaultIssuesCount
    var dateOfBirth = Constants.defaultDateOfBirth
      
      if let rowFirstName = row[0] {
        firstName = rowFirstName
      }
      
      if let rowLastName = row[1] {
        lastName = rowLastName
      }
      
      if let issues = row[2], let rowIssuesCount = Int(issues) {
        issuesCount = rowIssuesCount
      }
      
      if let rowDateOfBirth = row[3] {
        dateOfBirth = rowDateOfBirth
      }
      
      if firstName == Constants.defaultFirstName &&
          lastName == Constants.defaultLastName &&
          issuesCount == Constants.defaultIssuesCount &&
          dateOfBirth == Constants.defaultDateOfBirth {
        return nil
      } else {
        self.init(firstName: firstName,
                  lastName: lastName,
                  issuesCount: issuesCount,
                  dateOfBirth: dateOfBirth)
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
