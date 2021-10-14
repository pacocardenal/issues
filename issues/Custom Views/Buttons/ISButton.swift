//
//  ISButton.swift
//  issues
//
//  Created by m_949184 on 13/10/21.
//

import UIKit

final class ISButton: UIButton {
  
  enum Constants {
    static let cornerRadius: CGFloat = 10
    static let color: UIColor = .white
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  init(backgroundColor: UIColor, title: String) {
    super.init(frame: .zero)
    self.backgroundColor = backgroundColor
    self.setTitle(title, for: .normal)
    configure()
  }
  
  private func configure() {
    layer.cornerRadius = Constants.cornerRadius
    titleLabel?.textColor = Constants.color
    titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
    translatesAutoresizingMaskIntoConstraints = false
  }
  
}
