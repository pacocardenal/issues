//
//  UIView+Ext.swift
//  issues
//
//  Created by m_949184 on 18/10/21.
//

import UIKit

extension UIView {
  func addSubviews(_ views: UIView...) {
    views.forEach { addSubview($0) }
  }
}
