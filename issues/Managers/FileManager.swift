//
//  FileManager.swift
//  issues
//
//  Created by Paco Cardenal on 13/10/21.
//

import Foundation

final class FileManager {
  
  // MARK: - Enums
  enum Constants {
    static let fileName = "issues"
    static let fileExtension = "csv"
    static let newLineCharacter = "\n"
    static let doubleNewLineCharacter = "\n\n"
    static let separatorCharacter = ","
    static let carriageReturnCharacter = "\r"
    static let quoteCharacter = "\""
    static let emptyCharacter = ""
  }
  
  // MARK: - Properties
  static let shared = FileManager()
  
  // MARK: - Internal methods
  func getIssues(completed: @escaping(Result<[Issue], ISError>) -> Void) {
    guard let filepath = Bundle.main.path(forResource: Constants.fileName, ofType: Constants.fileExtension) else {
      completed(.failure(.invalidFile))
      return
    }
    
    var issues = [Issue]()
    do {
      let contents = try String(contentsOfFile: filepath, encoding: .utf8)
      let csvRows = readCsv(data: contents)
      for row in csvRows where row != csvRows.first {
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
    
    let rows = cleanData.components(separatedBy: Constants.newLineCharacter)
    for row in rows {
      let columns = row.components(separatedBy: Constants.separatorCharacter)
      result.append(columns)
    }
    
    return result
  }
  
  private func cleanRows(file: String) -> String {
    var cleanFile = file
    
    cleanFile = cleanFile.replacingOccurrences(of: Constants.carriageReturnCharacter, with: Constants.newLineCharacter)
    cleanFile = cleanFile.replacingOccurrences(of: Constants.doubleNewLineCharacter, with: Constants.newLineCharacter)
    cleanFile = cleanFile.replacingOccurrences(of: Constants.quoteCharacter, with: Constants.emptyCharacter)
    
    return cleanFile
  }
  
}
