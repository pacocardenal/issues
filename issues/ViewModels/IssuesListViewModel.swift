//
//  IssuesListViewModel.swift
//  issues
//
//  Created by Paco Cardenal on 21/10/21.
//

import Foundation

final class IssuesListViewModel {
  
  // MARK: - Properties
  private var manager: IssuesManager!
  private (set) var isssuesList = [Issue]() {
    didSet {
      bindIssuesListViewModelToController()
    }
  }
  var bindIssuesListViewModelToController: (() -> ()) = {}
  private (set) var errorMessage = String() {
    didSet {
      bindErrorMessageIssuesListViewModelToController()
    }
  }
  var bindErrorMessageIssuesListViewModelToController: (() -> ()) = {}
  
  // MARK: - Initializers
  convenience init(withManager manager: IssuesManager) {
    self.init()
    self.manager = manager
  }
  
  // MARK: - Internal methods
  func bind() {
    getIssues()
  }
  
  // MARK: - Private methods
  private func getIssues() {
    manager.getIssues { [weak self] result in
      guard let self = self else {
        self?.errorMessage = ISError.unknown.rawValue
        return
      }
      
      switch result {
      case .success(let issues):
        self.isssuesList.append(contentsOf: issues)
      case .failure(let error):
        self.errorMessage = error.rawValue
      }
    }
  }
  
}