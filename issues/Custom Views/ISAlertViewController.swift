//
//  ISAlertViewController.swift
//  issues
//
//  Created by m_949184 on 13/10/21.
//

import UIKit

final class ISAlertViewController: UIViewController {
  
  enum Constants {
    static let titleLabelFontSize: CGFloat = 20
    static let commonPadding: CGFloat = 20
    static let containerViewCornerRadius: CGFloat = 16
    static let containerViewCornerWidth: CGFloat = 2
    static let containerViewWidth: CGFloat = 280
    static let containerViewHeight: CGFloat = 200
    static let titleLabelHeight: CGFloat = 28
    static let actionButtonHeight: CGFloat = 44
    static let messageLabelNumerOfLines = 4
    
    static let actionButtonTitle = "Ok"
    static let titleLabelGenericMessage = "Something went wrong"
    static let messageLabelGenericMessage = "Unable to complete request"
    
    static let backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
  }
  
  let containerView = UIView()
  let titleLabel = ISTitleLabel(textAlignment: .center, fontSize: Constants.titleLabelFontSize)
  let messageLabel = ISBodyLabel(textAlignment: .center)
  let actionButton = ISButton(backgroundColor: .systemPink, title: Constants.actionButtonTitle)
  
  var alertTitle: String?
  var message: String?
  var buttonTitle: String?
  
  let padding: CGFloat = Constants.commonPadding
  
  init(title: String, message: String, buttonTitle: String) {
    super.init(nibName: nil, bundle: nil)
    self.alertTitle = title
    self.message = message
    self.buttonTitle = buttonTitle
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = Constants.backgroundColor
    configureContainerView()
    configureTitleLabel()
    configureActionButton()
    configureMessageLabel()
  }
  
  func configureContainerView() {
    view.addSubview(containerView)
    
    containerView.backgroundColor = .systemBackground
    containerView.layer.cornerRadius = Constants.containerViewCornerRadius
    containerView.layer.borderWidth = Constants.containerViewCornerWidth
    containerView.layer.borderColor = UIColor.white.cgColor
    
    NSLayoutConstraint.activate([
      containerView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
      containerView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
      containerView.widthAnchor.constraint(equalToConstant: Constants.containerViewWidth),
      containerView.heightAnchor.constraint(equalToConstant: Constants.containerViewHeight)
    ])
    
    containerView.translatesAutoresizingMaskIntoConstraints = false
  }
  
  func configureTitleLabel() {
    containerView.addSubview(titleLabel)
    titleLabel.text = alertTitle ?? Constants.titleLabelGenericMessage
    
    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: padding),
      titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
      titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
      titleLabel.heightAnchor.constraint(equalToConstant: Constants.titleLabelHeight)
    ])
    
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
  }
  
  func configureActionButton() {
    containerView.addSubview(actionButton)
    actionButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
    
    NSLayoutConstraint.activate([
      actionButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -padding),
      actionButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
      actionButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
      actionButton.heightAnchor.constraint(equalToConstant: Constants.actionButtonHeight)
    ])
    
    actionButton.translatesAutoresizingMaskIntoConstraints = false
  }
  
  func configureMessageLabel() {
    containerView.addSubview(messageLabel)
    messageLabel.text =  message ?? Constants.messageLabelGenericMessage
    messageLabel.numberOfLines = Constants.messageLabelNumerOfLines
    
    NSLayoutConstraint.activate([
      messageLabel.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: padding),
      messageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
      messageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
      messageLabel.bottomAnchor.constraint(equalTo: actionButton.topAnchor, constant: -padding)
    ])
    
    messageLabel.translatesAutoresizingMaskIntoConstraints = false
  }
  
  @objc func dismissVC() {
    dismiss(animated: true)
  }
  
}