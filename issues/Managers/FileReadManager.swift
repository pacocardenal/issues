//
//  ReadManager.swift
//  issues
//
//  Created by Paco Cardenal on 25/10/21.
//

import Foundation

final class FileReadManager {
  
  // MARK: - Enums
  private enum Constants {
    static let megaSize = 1024
    static let numberOfMegas = 1000
  }
  
  // MARK: - Properties
  static let shared = FileReadManager()
  
  // MARK: - Internal methods
  func readData(from filepath: String, chunkSize: Int = 1) throws -> String {
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
  
}
