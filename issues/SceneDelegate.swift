//
//  SceneDelegate.swift
//  issues
//
//  Created by m_949184 on 13/10/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  private enum Constants {
    static let issuesListViewControllerTitle = "Issues"
  }
  
  var window: UIWindow?

  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = (scene as? UIWindowScene) else { return }
    
    window = UIWindow(frame: windowScene.coordinateSpace.bounds)
    window?.windowScene = windowScene
    window?.rootViewController = createIssuesListNavigationController()
    window?.makeKeyAndVisible()
  }
  
  private func createIssuesListNavigationController() -> UINavigationController {
    let issuesListViewController = IssuesListViewController()
    issuesListViewController.title = Constants.issuesListViewControllerTitle
    return UINavigationController(rootViewController: issuesListViewController)
  }
  
  private func configureNavigationBar() {
    UINavigationBar.appearance().tintColor = .systemOrange
  }

}

