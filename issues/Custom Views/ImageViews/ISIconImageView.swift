//
//  ISIconImageView.swift
//  issues
//
//  Created by Paco Cardenal on 13/10/21.
//

import UIKit

final class ISIconImageView: UIImageView {
  
  // MARK: - Enums
  private enum Constants {
    static let cornerRadius: CGFloat = 10
  }
  
  // MARK: - Properties
  let placeHolderImage = SFSymbols.issuePlaceholder?.withRenderingMode(.alwaysTemplate)
  
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
    layer.cornerRadius = Constants.cornerRadius
    clipsToBounds = true
    tintColor = .systemGray
    image = placeHolderImage
    translatesAutoresizingMaskIntoConstraints = false
  }
  
}
