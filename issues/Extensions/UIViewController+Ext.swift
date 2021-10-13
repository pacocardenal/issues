//
//  UIViewController+Ext.swift
//  issues
//
//  Created by m_949184 on 13/10/21.
//

import UIKit

extension UIViewController {

     func presentISAlertOnMainThread(title: String, message: String, buttonTitle: String) {
         DispatchQueue.main.async {
             let alertViewController = ISAlertViewController(title: title, message: message, buttonTitle: buttonTitle)
             alertViewController.modalPresentationStyle = .overFullScreen
             alertViewController.modalTransitionStyle = .crossDissolve
             self.present(alertViewController, animated: true)
         }
     }

 }
