//
//  SceneDelegate.swift
//  issues
//
//  Created by Paco Cardenal on 13/10/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  
  // MARK: - Enums
  private enum Constants {
    static let issuesListViewControllerTitle = "Issues"
  }
  
  // MARK: - Properties
  var window: UIWindow?
  
  // MARK: - Life cycle
  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = (scene as? UIWindowScene) else { return }
    
    window = UIWindow(frame: windowScene.coordinateSpace.bounds)
    window?.windowScene = windowScene
    window?.rootViewController = createIssuesListNavigationController()
    window?.makeKeyAndVisible()
  }
  
  // MARK: - Private methods
  private func createIssuesListNavigationController() -> UINavigationController {
    let issuesListViewController = IssuesListViewController()
    issuesListViewController.title = Constants.issuesListViewControllerTitle
    return UINavigationController(rootViewController: issuesListViewController)
  }
  
  private func configureNavigationBar() {
    UINavigationBar.appearance().tintColor = .systemOrange
  }
  
}

