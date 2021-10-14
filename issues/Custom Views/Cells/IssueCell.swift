//
//  IssueCell.swift
//  issues
//
//  Created by m_949184 on 13/10/21.
//

import UIKit

class IssueCell: UICollectionViewCell {
  static let reuseId = "IssueCell"
  
  let iconImageView = ISIconImageView(frame: .zero)
  let nameLabel = ISTitleLabel(textAlignment: .left, fontSize: 16)
  let dateOfBirthLabel = ISBodyLabel(textAlignment: .left)
  let issuesCountLabel = ISTitleLabel(textAlignment: .right, fontSize: 26)
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func configure() {
    addSubview(iconImageView)
    addSubview(nameLabel)
    addSubview(dateOfBirthLabel)
    addSubview(issuesCountLabel)
    
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
  
  func set(issue: Issue) {
    nameLabel.text = issue.fullName
    dateOfBirthLabel.text = issue.dateOfBirth
    if let numberOfIssues = issue.issueCount {
      issuesCountLabel.text = "\(numberOfIssues)"
    }
  }
}
