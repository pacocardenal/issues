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
    presentBAAlertOnMainThread(title: "Alert Test", message: "It seems that the custom alert is working fine 🙂", buttonTitle: "Ok!")
  }
  
}

