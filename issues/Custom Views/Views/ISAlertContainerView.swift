//
//  ISAlertContainerView.swift
//  issues
//
//  Created by m_949184 on 18/10/21.
//

import UIKit

class ISAlertContainerView: UIView {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func configure() {
    backgroundColor = .systemBackground
    layer.cornerRadius = 16
    layer.borderWidth = 2
    layer.borderColor = UIColor.white.cgColor
    translatesAutoresizingMaskIntoConstraints = false
  }
  
}
