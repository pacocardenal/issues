//
//  ViewController.swift
//  issues
//
//  Created by m_949184 on 13/10/21.
//

import UIKit

final class IssuesListViewController: UIViewController {
  
  enum Section {
    case main
  }
  
  var collectionView: UICollectionView!
  var issues = [Issue]()
  var filteredIssues = [Issue]()
  var dataSource: UICollectionViewDiffableDataSource<Section, Issue>!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureViewController()
    configureCollectionView()
    configureSearchController()
    configureDataSource()
    getIssues()
    
  }
  
  private func configureViewController() {
    view.backgroundColor = .systemBackground
    navigationController?.navigationBar.prefersLargeTitles = true
  }
  
  private func configureCollectionView() {
    collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createOneColumnFlowLayout(in: view))
    view.addSubview(collectionView)
    collectionView.backgroundColor = .systemBackground
    collectionView.register(IssueCell.self, forCellWithReuseIdentifier: IssueCell.reuseId)
  }
  
  private func configureSearchController() {
       let searchController = UISearchController()
       searchController.searchBar.delegate = self
       searchController.searchResultsUpdater = self
       searchController.searchBar.placeholder = "Search..."
       searchController.obscuresBackgroundDuringPresentation = false
       navigationItem.searchController = searchController
   }
  
  private func configureDataSource() {
    dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView,
                                                    cellProvider: { (collectionView, indexPath, issue) -> UICollectionViewCell? in
      guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: IssueCell.reuseId, for: indexPath) as? IssueCell else {
        fatalError("""
                        Could not cast cell to \(IssueCell.self)
                        File: \(#file)
                        Function: \(#function)
                        Line: \(#line)
                        """)
      }
      cell.set(issue: issue)
      return cell
    })
  }
  
  private func updateData(on issues: [Issue]) {
    var snapshot = NSDiffableDataSourceSnapshot<Section, Issue>()
    snapshot.appendSections([.main])
    snapshot.appendItems(issues)
    DispatchQueue.main.async {
      self.dataSource.apply(snapshot, animatingDifferences: true)
    }
  }
  
  private func getIssues() {
    showLoadingView()
    FileManager.shared.getIssues { [weak self] result in
      guard let self = self else { return }
      
      self.dismissLoadingView()
      switch result {
      case .success(let issues):
        self.issues = issues
        if self.issues.isEmpty {
          let message = "The datasource doesn't have any issues 🥲"
          DispatchQueue.main.async {
            self.showEmptyState(with: message, in: self.view)
          }
          return
        }
        self.updateData(on: issues)
      case .failure(let error):
        self.presentISAlertOnMainThread(title: "Bad stuff happened", message: error.rawValue, buttonTitle: "Ok")
      }
    }
  }
  
}

extension IssuesListViewController: UISearchBarDelegate, UISearchResultsUpdating {
  
  func updateSearchResults(for searchController: UISearchController) {
       guard let filter = searchController.searchBar.text, !filter.isEmpty else { return }

       filteredIssues = issues.filter { $0.fullName?.lowercased().contains(filter.lowercased()) ?? false }
       updateData(on: filteredIssues)
   }

   func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
       updateData(on: issues)
   }
  
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
       if searchText.isEmpty {
           updateData(on: issues)
       }
   }
  
}

