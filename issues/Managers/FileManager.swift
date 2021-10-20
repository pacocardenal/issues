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
    
    var completeFileString = ""
    var issues = [Issue]()
    
    do {
      
      let data = try Data(contentsOf: URL(fileURLWithPath: filepath))
      let dataLen = data.count
      // Reads in chunks of 1 MB
      let chunkSize = ((1024 * 1000) * 1)
      let fullChunks = Int(dataLen / chunkSize)
      let totalChunks = fullChunks + (dataLen % 1024 != 0 ? 1 : 0)

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
      
      let csvRows = readCsv(data: completeFileString)
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
