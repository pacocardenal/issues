//
//  MockFileTypeManager.swift
//  issuesTests
//
//  Created by Paco Cardenal on 26/10/21.
//

import Foundation
@testable import issues

class MockFileTypeManager {
  
  // MARK: - Properties
  private var issues = [Issue]()
  
  // MARK: - Initializers
  convenience init(issues: [Issue]) {
    self.init()
    self.issues = issues
  }
  
}

// MARK: FileTypeManager protocol
extension MockFileTypeManager: FileTypeManager {
  
  func read(content: String) -> [Issue] {
    return issues
  }
  
}
