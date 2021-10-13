//
//  ISIconImageView.swift
//  issues
//
//  Created by m_949184 on 13/10/21.
//

import UIKit

class ISIconImageView: UIImageView {
  
  var placeHolderImage = UIImage(systemName: "ant.circle")?.withRenderingMode(.alwaysTemplate)
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func configure() {
    layer.cornerRadius = 10
    clipsToBounds = true
    tintColor = .systemGray
    image = placeHolderImage
    translatesAutoresizingMaskIntoConstraints = false
  }
  
}
