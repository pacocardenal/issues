//
//  ViewController.swift
//  issues
//
//  Created by m_949184 on 13/10/21.
//

import UIKit

class IssuesListViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    navigationController?.navigationBar.prefersLargeTitles = true
    
    FileManager.shared.getIssues { result in
      switch result {
      case .success(let issues):
        print("Issues count: \(issues.count)")
        print(issues)
      case .failure(let error):
        self.presentISAlertOnMainThread(title: "Bad stuff happened",
                                        message: error.rawValue,
                                        buttonTitle: "Ok")
      }
    }
  }
  
}

