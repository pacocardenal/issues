//
//  ISDataLoadingViewController.swift
//  issues
//
//  Created by Paco Cardenal on 18/10/21.
//

import UIKit

class ISDataLoadingViewController: UIViewController {
  
  // MARK: - Enums
  enum Constants {
    static let animationAlphaBegin: CGFloat = 0
    static let animationAlphaEnd: CGFloat = 0.8
    static let animationDuration: TimeInterval = 0.25
  }
  
  // MARK: - Properties
  var containerView: UIView!
  
  // MARK: - Internal methods
  func showLoadingView() {
    containerView = UIView(frame: view.bounds)
    view.addSubview(containerView)
    containerView.backgroundColor = .systemBackground
    containerView.alpha = Constants.animationAlphaBegin
    UIView.animate(withDuration: Constants.animationDuration) {
      self.containerView.alpha = Constants.animationAlphaEnd
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
