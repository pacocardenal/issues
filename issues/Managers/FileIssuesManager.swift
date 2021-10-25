//
//  FileManager.swift
//  issues
//
//  Created by Paco Cardenal on 13/10/21.
//

import Foundation

final class FileIssuesManager: IssuesManager {
  
  // MARK: - Properties
  static let shared = FileIssuesManager()
  
  // MARK: - Internal methods
  func getIssues(withFileTypeManager fileTypeManager: FileTypeManager,
                 completed: @escaping(Result<[Issue], ISError>) -> Void) {
    guard let filepath = Bundle.main.path(forResource: SourceFile.fileName, ofType: SourceFile.fileExtension) else {
      completed(.failure(.invalidFile))
      return
    }
    do {
      let issues = try fileTypeManager.read(filePath: filepath)
      completed(.success(sort(issues)))
    } catch {
      completed(.failure(.invalidData))
    }
  }
  
  // MARK: - Private methods
  private func sort(_ issues: [Issue]) -> [Issue] {
    return issues.sorted(by: {
      if let firstFullName = $0.fullName, let secondFullName = $1.fullName {
        return firstFullName < secondFullName
      }
      return false
    })
  }
  
}
