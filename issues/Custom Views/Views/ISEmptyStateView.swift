//
//  ISEmptyStateView.swift
//  issues
//
//  Created by Paco Cardenal on 14/10/21.
//

import UIKit

final class ISEmptyStateView: UIView {
  
  // MARK: - Enums
  enum Constants {
    static let messageLabelFontSize: CGFloat = 28
    static let messageLabelNumberOfLines = 3
    static let imageViewOffset: CGFloat = 150
    static let messageLabelHeight: CGFloat = 200
    static let commonPadding: CGFloat = 40
    static let imageViewSizeMultiplier: CGFloat = 1.3
  }
  
  // MARK: - Properties
  let messageLabel = ISTitleLabel(textAlignment: .center, fontSize: Constants.messageLabelFontSize)
  let logoImageView = UIImageView()
  
  // MARK: - Initializers
  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  init(message: String) {
    super.init(frame: .zero)
    messageLabel.text = message
    configure()
  }
  
  // MARK: - Private methods
  private func configure() {
    addSubviews(messageLabel, logoImageView)
    
    messageLabel.numberOfLines = Constants.messageLabelNumberOfLines
    messageLabel.textColor = .secondaryLabel
    
    logoImageView.image = SFSymbols.issueListEmptyView?.withRenderingMode(.alwaysTemplate)
    logoImageView.tintColor = .systemGray
    
    NSLayoutConstraint.activate([
      messageLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -Constants.imageViewOffset),
      messageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Constants.commonPadding),
      messageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Constants.commonPadding),
      messageLabel.heightAnchor.constraint(equalToConstant: Constants.messageLabelHeight),
      logoImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: Constants.imageViewSizeMultiplier),
      logoImageView.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: Constants.imageViewSizeMultiplier),
      logoImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: Constants.imageViewOffset),
      logoImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: Constants.commonPadding)
    ])
    
    logoImageView.translatesAutoresizingMaskIntoConstraints = false
  }
  
}
