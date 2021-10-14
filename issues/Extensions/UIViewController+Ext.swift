//
//  UIViewController+Ext.swift
//  issues
//
//  Created by m_949184 on 13/10/21.
//

import UIKit

private var containerView: UIView!

extension UIViewController {
  
  func presentISAlertOnMainThread(title: String, message: String, buttonTitle: String) {
    DispatchQueue.main.async {
      let alertViewController = ISAlertViewController(title: title, message: message, buttonTitle: buttonTitle)
      alertViewController.modalPresentationStyle = .overFullScreen
      alertViewController.modalTransitionStyle = .crossDissolve
      self.present(alertViewController, animated: true)
    }
  }
  
  func showLoadingView() {
    containerView = UIView(frame: view.bounds)
    view.addSubview(containerView)
    containerView.backgroundColor = .systemBackground
    containerView.alpha = 0
    UIView.animate(withDuration: 0.25) {
      containerView.alpha = 0.8
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
      containerView.removeFromSuperview()
      containerView = nil
    }
  }
  
  func showEmptyState(with message: String, in view: UIView) {
    let emptyStateView = ISEmptyStateView(message: message)
    emptyStateView.frame = view.bounds
    view.addSubview(emptyStateView)
  }
  
}
