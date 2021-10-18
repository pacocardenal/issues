//
//  FileManager.swift
//  issues
//
//  Created by Paco Cardenal on 13/10/21.
//

import Foundation

final class FileManager {
  
  // MARK: - Properties
  static let shared = FileManager()
  
  // MARK: - Internal methods
  func getIssues(completed: @escaping(Result<[Issue], ISError>) -> Void) {
    guard let filepath = Bundle.main.path(forResource: "issues", ofType: "csv") else {
      completed(.failure(.invalidFile))
      return
    }
    
    var issues = [Issue]()
    do {
      let contents = try String(contentsOfFile: filepath, encoding: .utf8)
      let csvRows = readCsv(data: contents)
      for row in csvRows {
        if let issue = Issue(row: row) {
          issues.append(issue)
        }
      }
      completed(.success(issues))
    } catch {
      completed(.failure(.invalidData))
    }
    
  }
  
  // MARK: - Private methods
  private func readCsv(data: String) -> [[String]] {
    var result: [[String]] = []
    let cleanData = cleanRows(file: data)
    
    let rows = cleanData.components(separatedBy: "\n")
    for row in rows {
      let columns = row.components(separatedBy: ",")
      result.append(columns)
    }
    
    return result
  }
  
  private func cleanRows(file: String) -> String {
    var cleanFile = file
    
    cleanFile = cleanFile.replacingOccurrences(of: "\r", with: "\n")
    cleanFile = cleanFile.replacingOccurrences(of: "\n\n", with: "\n")
    cleanFile = cleanFile.replacingOccurrences(of: "\"", with: "")
    
    return cleanFile
  }
  
}
