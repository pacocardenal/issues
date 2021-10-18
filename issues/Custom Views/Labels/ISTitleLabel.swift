//
//  ISTitleLabel.swift
//  issues
//
//  Created by Paco Cardenal on 13/10/21.
//

import UIKit

final class ISTitleLabel: UILabel {
  
  // MARK: - Enums
  enum Constants {
    static let minimumScaleFactor: CGFloat = 0.9
  }
  
  // MARK: - Initializers
  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  convenience init(textAlignment: NSTextAlignment, fontSize: CGFloat) {
    self.init(frame: .zero)
    self.textAlignment = textAlignment
    font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
  }
  
  // MARK: - Private methods
  private func configure() {
    textColor = .label
    adjustsFontSizeToFitWidth = true
    minimumScaleFactor = Constants.minimumScaleFactor
    lineBreakMode = .byTruncatingTail
    translatesAutoresizingMaskIntoConstraints = false
  }
  
}
