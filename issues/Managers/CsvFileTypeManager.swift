//
//  CsvManager.swift
//  issues
//
//  Created by Paco Cardenal on 25/10/21.
//

import Foundation

final class CsvFileTypeManager: FileTypeManager {
  
  // MARK: - Enums
  private enum Constants {
    static let newLineCharacter = "\n"
    static let doubleNewLineCharacter = "\n\n"
    static let separatorCharacter = ","
    static let carriageReturnCharacter = "\r"
    static let quoteCharacter = "\""
    static let emptyCharacter = ""
  }
  
  // MARK: - Properties
  static let shared = CsvFileTypeManager()
  
  // MARK: - Internal methods
  func read(content: String) -> [Issue] {
    var csvRows: [[String]] = []
    var issues = [Issue]()
    
    let cleanData = cleanRows(file: content)
    
    let rows = cleanData.components(separatedBy: Constants.newLineCharacter)
    for row in rows {
      let columns = row.components(separatedBy: Constants.separatorCharacter)
      csvRows.append(columns)
    }
    
    for row in csvRows where row != csvRows.first {
      if let issue = Issue(row: row) {
        issues.append(issue)
      }
    }
    
    return issues
  }
  
  // MARK: - Private methods
  private func cleanRows(file: String) -> String {
    var cleanFile = file
    
    cleanFile = cleanFile.replacingOccurrences(of: Constants.carriageReturnCharacter, with: Constants.newLineCharacter)
    cleanFile = cleanFile.replacingOccurrences(of: Constants.doubleNewLineCharacter, with: Constants.newLineCharacter)
    cleanFile = cleanFile.replacingOccurrences(of: Constants.quoteCharacter, with: Constants.emptyCharacter)
    
    return cleanFile
  }
  
}
