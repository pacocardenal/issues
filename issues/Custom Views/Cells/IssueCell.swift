//
//  IssueCell.swift
//  issues
//
//  Created by Paco Cardenal on 13/10/21.
//

import UIKit

final class IssueCell: UICollectionViewCell {
  
  // MARK: - Enums
  enum Constants {
    static let bodyLabelFontSize: CGFloat = 16
    static let titleLabelFontSize: CGFloat = 26
    static let containerViewCornerRadius: CGFloat = 16
    static let containerViewBorderWidth: CGFloat = 1
    static let containerViewShadowOpacity: Float = 0.2
    static let containerViewShadowRadius: CGFloat = 10
    static let containerViewHeight: CGFloat = 80
    static let commonPadding: CGFloat = 8
    static let iconImageViewWidth: CGFloat = 50
  }
  
  // MARK: - Properties
  static let reuseId = "IssueCell"
  
  let containerView = UIView()
  let stackView = UIStackView()
  let iconImageView = ISIconImageView(frame: .zero)
  let nameLabel = ISTitleLabel(textAlignment: .left, fontSize: Constants.bodyLabelFontSize)
  let dateOfBirthLabel = ISBodyLabel(textAlignment: .left)
  let issuesCountLabel = ISTitleLabel(textAlignment: .right, fontSize: Constants.titleLabelFontSize)
  
  // MARK: - Initializers
  override init(frame: CGRect) {
    super.init(frame: frame)
    configureContainerView()
    configureStackView()
    layoutUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Internal methods
  func set(issue: Issue) {
    nameLabel.text = issue.fullName
    dateOfBirthLabel.text = issue.dateOfBirth?.convertToDisplayFormat()
    if let numberOfIssues = issue.issuesCount {
      issuesCountLabel.text = "\(numberOfIssues)"
    }
  }
  
  // MARK: - Private methods
  private func configureContainerView() {
    addSubview(containerView)
    
    containerView.backgroundColor = .systemBackground
    containerView.layer.cornerRadius = Constants.containerViewCornerRadius
    containerView.layer.borderWidth = Constants.containerViewBorderWidth
    containerView.layer.borderColor = UIColor.white.cgColor
    
    containerView.layer.shadowColor = UIColor.systemGray.cgColor
    containerView.layer.shadowOpacity = Constants.containerViewShadowOpacity
    containerView.layer.shadowOffset = .zero
    containerView.layer.shadowRadius = Constants.containerViewShadowRadius
    
    NSLayoutConstraint.activate([
      containerView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
      containerView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
      containerView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor),
      containerView.heightAnchor.constraint(equalToConstant: Constants.containerViewHeight)
    ])
    
    containerView.translatesAutoresizingMaskIntoConstraints = false
  }
  
  private func configureStackView() {
    stackView.axis = .vertical
    stackView.distribution = .fillEqually
    
    stackView.addArrangedSubview(nameLabel)
    stackView.addArrangedSubview(dateOfBirthLabel)
  }
  
  private func layoutUI() {
    containerView.addSubviews(iconImageView, stackView, issuesCountLabel)
    
    let padding: CGFloat = Constants.commonPadding
    
    NSLayoutConstraint.activate([
      iconImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
      iconImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
      iconImageView.widthAnchor.constraint(equalToConstant: Constants.iconImageViewWidth),
      iconImageView.heightAnchor.constraint(equalTo: iconImageView.widthAnchor),
      
      stackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: padding),
      stackView.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: padding),
      stackView.trailingAnchor.constraint(equalTo: issuesCountLabel.leadingAnchor, constant: -padding),
      stackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -padding),
      
      issuesCountLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
      issuesCountLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding * 3),
      issuesCountLabel.heightAnchor.constraint(equalToConstant: Constants.iconImageViewWidth)
    ])
    
    stackView.translatesAutoresizingMaskIntoConstraints = false
  }
  
}
