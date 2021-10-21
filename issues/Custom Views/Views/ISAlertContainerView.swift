//
//  ISAlertContainerView.swift
//  issues
//
//  Created by Paco Cardenal on 18/10/21.
//

import UIKit

final class ISAlertContainerView: UIView {
  
  // MARK: - Enums
  private enum Constants {
    static let cornerRadius: CGFloat = 16
    static let borderWidth: CGFloat = 2
  }
  
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
    layer.cornerRadius = Constants.cornerRadius
    layer.borderWidth = Constants.borderWidth
    layer.borderColor = UIColor.white.cgColor
    translatesAutoresizingMaskIntoConstraints = false
  }
  
}
