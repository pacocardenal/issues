//
//  Issue.swift
//  issues
//
//  Created by m_949184 on 13/10/21.
//

import Foundation

struct Issue {
  let firstName: String?
  let lastName: String?
  let issueCount: Int?
  let dateOfBirth: String?
}

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
