//
//  ISAlertContainerView.swift
//  issues
//
//  Created by Paco Cardenal on 18/10/21.
//

import UIKit

final class ISAlertContainerView: UIView {
  
  // MARK: - Initializers
  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Private methods
  private func configure() {
    backgroundColor = .systemBackground
    layer.cornerRadius = 16
    layer.borderWidth = 2
    layer.borderColor = UIColor.white.cgColor
    translatesAutoresizingMaskIntoConstraints = false
  }
  
}
