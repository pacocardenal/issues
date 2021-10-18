//
//  ISBodyLabel.swift
//  issues
//
//  Created by Paco Cardenal on 13/10/21.
//

import UIKit

final class ISBodyLabel: UILabel {
  
  // MARK: - Enums
  enum Constants {
    static let minimumScaleFactor: CGFloat = 0.75
  }
  
  // MARK: - Initializers
  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  convenience init(textAlignment: NSTextAlignment) {
    self.init(frame: .zero)
    self.textAlignment = textAlignment
  }
  
  // MARK: - Private methods
  private func configure() {
    textColor = .secondaryLabel
    font = UIFont.preferredFont(forTextStyle: .body)
    adjustsFontForContentSizeCategory = true
    adjustsFontSizeToFitWidth = true
    minimumScaleFactor = Constants.minimumScaleFactor
    lineBreakMode = .byWordWrapping
    translatesAutoresizingMaskIntoConstraints = false
  }
  
}
