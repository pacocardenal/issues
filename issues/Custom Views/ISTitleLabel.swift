//
//  ISTitleLabel.swift
//  issues
//
//  Created by m_949184 on 13/10/21.
//

import UIKit

final class ISTitleLabel: UILabel {
  
  enum Constants {
    static let minimumScaleFactor: CGFloat = 0.9
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  init(textAlignment: NSTextAlignment, fontSize: CGFloat) {
    super.init(frame: .zero)
    self.textAlignment = textAlignment
    font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
    configure()
  }
  
  private func configure() {
    textColor = .label
    adjustsFontSizeToFitWidth = true
    minimumScaleFactor = Constants.minimumScaleFactor
    lineBreakMode = .byTruncatingTail
    translatesAutoresizingMaskIntoConstraints = false
  }
  
}
