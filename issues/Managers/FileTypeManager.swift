//
//  FileTypeManager.swift
//  issues
//
//  Created by Paco Cardenal on 25/10/21.
//

import Foundation

protocol FileTypeManager {
  
  func read(filePath: String) throws -> [Issue]
  
}
