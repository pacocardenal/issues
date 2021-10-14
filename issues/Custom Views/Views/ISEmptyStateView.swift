//
//  ISEmptyStateView.swift
//  issues
//
//  Created by m_949184 on 14/10/21.
//

import UIKit

class ISEmptyStateView: UIView {
  
  let messageLabel = ISTitleLabel(textAlignment: .center, fontSize: 28)
  let logoImageView = UIImageView()
  
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
  
  private func configure() {
    addSubview(messageLabel)
    addSubview(logoImageView)
    
    messageLabel.numberOfLines = 3
    messageLabel.textColor = .secondaryLabel
    
    logoImageView.image = UIImage(systemName: SFSymbols.issueListEmptyView)?.withRenderingMode(.alwaysTemplate)
    logoImageView.tintColor = .systemGray
    
    NSLayoutConstraint.activate([
      messageLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -150),
      messageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
      messageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
      messageLabel.heightAnchor.constraint(equalToConstant: 200),
      logoImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.3),
      logoImageView.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.3),
      logoImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 170),
      logoImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 40)
    ])
    
    logoImageView.translatesAutoresizingMaskIntoConstraints = false
  }
  
}
