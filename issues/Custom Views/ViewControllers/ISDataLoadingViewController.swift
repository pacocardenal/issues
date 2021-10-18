//
//  ISDataLoadingViewController.swift
//  issues
//
//  Created by m_949184 on 18/10/21.
//

import UIKit

class ISDataLoadingViewController: UIViewController {
  
  var containerView: UIView!
  
  func showLoadingView() {
    containerView = UIView(frame: view.bounds)
    view.addSubview(containerView)
    containerView.backgroundColor = .systemBackground
    containerView.alpha = 0
    UIView.animate(withDuration: 0.25) {
      self.containerView.alpha = 0.8
    }
    
    let activityIndicator = UIActivityIndicatorView(style: .large)
    containerView.addSubview(activityIndicator)
    activityIndicator.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    ])
    
    activityIndicator.startAnimating()
  }
  
  func dismissLoadingView() {
    DispatchQueue.main.async {
      self.containerView.removeFromSuperview()
      self.containerView = nil
    }
  }
  
  func showEmptyState(with message: String, in view: UIView) {
    let emptyStateView = ISEmptyStateView(message: message)
    emptyStateView.frame = view.bounds
    view.addSubview(emptyStateView)
  }
  
}
