//
//  FileManager.swift
//  issues
//
//  Created by m_949184 on 13/10/21.
//

import Foundation

class FileManager {
  
  static let shared = FileManager()
  private let mockIssues = [
    Issue(firstName: "First name 1",
          lastName: "Last name 1",
          issueCount: 1,
          dateOfBirth: "1111-11-11T11:11:11"),
    Issue(firstName: "First name 2",
          lastName: "Last name 2",
          issueCount: 2,
          dateOfBirth: "2222-22-22T22:22:22"),
  ]
  
  func getIssues(completed: @escaping(Result<[Issue], ISError>) -> Void) {
    completed(.success(mockIssues))
  }
  
}
