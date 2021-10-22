//
//  FileManager.swift
//  issues
//
//  Created by Paco Cardenal on 13/10/21.
//

import Foundation

final class FileManager: IssuesManager {
  
  // MARK: - Enums
  private enum Constants {
    static let fileName = "issues"
    static let fileExtension = "csv"
    static let newLineCharacter = "\n"
    static let doubleNewLineCharacter = "\n\n"
    static let separatorCharacter = ","
    static let carriageReturnCharacter = "\r"
    static let quoteCharacter = "\""
    static let emptyCharacter = ""
    static let megaSize = 1024
    static let numberOfMegas = 1000
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
      let completeFileString = try readData(from: filepath)
      let csvRows = readCsv(data: completeFileString)
      for row in csvRows where row != csvRows.first {
        if let issue = Issue(row: row) {
          issues.append(issue)
        }
      }
      completed(.success(sort(issues)))
    } catch {
      completed(.failure(.invalidData))
    }
    
  }
  
  // MARK: - Private methods
  private func readData(from filepath: String, chunkSize: Int = 1) throws -> String {
    var completeFileString = ""
    
    let data = try Data(contentsOf: URL(fileURLWithPath: filepath))
    let dataLen = data.count
    // Reads in chunks of chunkSize MB
    let chunkSize = ((Constants.megaSize * Constants.numberOfMegas) * chunkSize)
    let fullChunks = Int(dataLen / chunkSize)
    let totalChunks = fullChunks + (dataLen % Constants.megaSize != 0 ? 1 : 0)
    
    for chunkCounter in 0 ..< totalChunks {
      var chunk: Data
      let chunkBase = chunkCounter * chunkSize
      var diff = chunkSize
      if(chunkCounter == totalChunks - 1) {
        diff = dataLen - chunkBase
      }
      let range: Range<Data.Index> = (chunkBase ..< (chunkBase + diff))
      chunk = data.subdata(in: range)
      if let stringChunk = String(data: chunk, encoding: .utf8) {
        completeFileString += stringChunk
      }
    }
    
    return completeFileString
  }
  
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
  
  private func sort(_ issues: [Issue]) -> [Issue] {
    return issues.sorted(by: {
      if let firstFullName = $0.fullName, let secondFullName = $1.fullName {
        return firstFullName < secondFullName
      }
      return false
    })
  }
  
}
