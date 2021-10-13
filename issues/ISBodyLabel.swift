//
//  ISBodyLabel.swift
//  issues
//
//  Created by m_949184 on 13/10/21.
//

import UIKit

final class ISBodyLabel: UILabel {
  
  enum Constants {
    static let minimumScaleFactor: CGFloat = 0.75
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  init(textAlignment: NSTextAlignment) {
    super.init(frame: .zero)
    self.textAlignment = textAlignment
    configure()
  }
  
  private func configure() {
    textColor = .secondaryLabel
    font = UIFont.preferredFont(forTextStyle: .body)
    adjustsFontSizeToFitWidth = true
    minimumScaleFactor = Constants.minimumScaleFactor
    lineBreakMode = .byWordWrapping
    translatesAutoresizingMaskIntoConstraints = false
  }
  
}
