//
//  IssueCell.swift
//  issues
//
//  Created by Paco Cardenal on 13/10/21.
//

import UIKit

final class IssueCell: UICollectionViewCell {
  
  // MARK: - Properties
  static let reuseId = "IssueCell"
  
  let containerView = UIView()
  let stackView = UIStackView()
  let iconImageView = ISIconImageView(frame: .zero)
  let nameLabel = ISTitleLabel(textAlignment: .left, fontSize: 16)
  let dateOfBirthLabel = ISBodyLabel(textAlignment: .left)
  let issuesCountLabel = ISTitleLabel(textAlignment: .right, fontSize: 26)
  
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
    dateOfBirthLabel.text = issue.dateOfBirth
    if let numberOfIssues = issue.issueCount {
      issuesCountLabel.text = "\(numberOfIssues)"
    }
  }
  
  // MARK: - Private methods
  private func configureContainerView() {
    addSubview(containerView)
    
    containerView.backgroundColor = .systemBackground
    containerView.layer.cornerRadius = 16
    containerView.layer.borderWidth = 1
    containerView.layer.borderColor = UIColor.white.cgColor
    
    containerView.layer.shadowColor = UIColor.systemGray.cgColor
    containerView.layer.shadowOpacity = 0.2
    containerView.layer.shadowOffset = .zero
    containerView.layer.shadowRadius = 10
    
    NSLayoutConstraint.activate([
      containerView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
      containerView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
      containerView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor),
      containerView.heightAnchor.constraint(equalToConstant: 80)
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
    
    let padding: CGFloat = 8
    
    NSLayoutConstraint.activate([
      iconImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
      iconImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
      iconImageView.widthAnchor.constraint(equalToConstant: 60),
      iconImageView.heightAnchor.constraint(equalTo: iconImageView.widthAnchor),
      
      stackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: padding),
      stackView.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: padding),
      stackView.trailingAnchor.constraint(equalTo: issuesCountLabel.leadingAnchor, constant: -padding),
      stackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -padding),
      
      issuesCountLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
      issuesCountLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding * 3),
      issuesCountLabel.heightAnchor.constraint(equalToConstant: 60)
    ])
    
    stackView.translatesAutoresizingMaskIntoConstraints = false
  }
  
  private func configure() {
    addSubviews(iconImageView, nameLabel, dateOfBirthLabel, issuesCountLabel)
    
    let padding: CGFloat = 8
    
    NSLayoutConstraint.activate([
      iconImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
      iconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
      iconImageView.widthAnchor.constraint(equalToConstant: 60),
      iconImageView.heightAnchor.constraint(equalTo: iconImageView.widthAnchor),
      
      nameLabel.topAnchor.constraint(equalTo: iconImageView.topAnchor, constant: 12),
      nameLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: padding),
      nameLabel.trailingAnchor.constraint(equalTo: issuesCountLabel.leadingAnchor, constant: -padding),
      nameLabel.heightAnchor.constraint(equalToConstant: 12),
      
      dateOfBirthLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: padding),
      dateOfBirthLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
      dateOfBirthLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
      dateOfBirthLabel.heightAnchor.constraint(equalToConstant: 12),
      
      issuesCountLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
      issuesCountLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding * 2),
      issuesCountLabel.heightAnchor.constraint(equalToConstant: 60)
    ])
  }
  
}
