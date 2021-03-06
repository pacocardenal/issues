//
//  IssuesManager.swift
//  issues
//
//  Created by Paco Cardenal on 21/10/21.
//

import Foundation

protocol IssuesManager {
  
  func getIssues(withFileTypeManager fileTypeManager: FileTypeManager,
                 completed: @escaping(Result<[Issue], ISError>) -> Void)

}
