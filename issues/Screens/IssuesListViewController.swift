//
//  ViewController.swift
//  issues
//
//  Created by Paco Cardenal on 13/10/21.
//

import UIKit

final class IssuesListViewController: ISDataLoadingViewController {
  
  enum Constants {
    static let searchControllerPlaceholder = "Search"
    static let getIssuesFailureTitle = "Bad Stuff Happened"
    static let getIssuesFailureButtonTitle = "Ok"
    static let noIssuesMessage = "The datasource doesn't have any issues 🥲"
  }
  
  // MARK: - Enums
  enum Section {
    case main
  }
  
  // MARK: - Properties
  private var collectionView: UICollectionView!
  private var issues = [Issue]()
  private var filteredIssues = [Issue]()
  private var dataSource: UICollectionViewDiffableDataSource<Section, Issue>!
  private var issuesListViewModel: IssuesListViewModel!
  
  // MARK: - View life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupBinding()
    configureViewController()
    configureCollectionView()
    configureSearchController()
    configureDataSource()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    getIssues()
  }
  
  // MARK: - Private methods
  private func setupBinding() {
    issuesListViewModel = IssuesListViewModel(withManager: FileManager.shared)
    issuesListViewModel.bindIssuesListViewModelToController = {
      self.dismissLoadingView()
      self.updateUI(with: self.issuesListViewModel.isssuesList)
    }
    issuesListViewModel.bindErrorMessageIssuesListViewModelToController = {
      self.dismissLoadingView()
      self.presentISAlertOnMainThread(title: Constants.getIssuesFailureTitle, message: self.issuesListViewModel.errorMessage, buttonTitle: Constants.getIssuesFailureButtonTitle)
    }
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
    searchController.searchBar.placeholder = Constants.searchControllerPlaceholder
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
    self.showLoadingView()
    issuesListViewModel.bind()
  }
  
  private func updateUI(with issues: [Issue]) {
    self.issues = issues
    if self.issues.isEmpty {
      let message = Constants.noIssuesMessage
      DispatchQueue.main.async {
        self.showEmptyState(with: message, in: self.view)
      }
      return
    }
    self.updateData(on: issues)
  }
  
}

// MARK: - Extension UISearchController
extension IssuesListViewController: UISearchBarDelegate, UISearchResultsUpdating {
  
  func updateSearchResults(for searchController: UISearchController) {
    guard let filter = searchController.searchBar.text, !filter.isEmpty else { return }
    
    filteredIssues = issuesListViewModel.isssuesList.filter { $0.fullName?.lowercased().contains(filter.lowercased()) ?? false }
    updateData(on: filteredIssues)
  }
  
  func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    updateData(on: issuesListViewModel.isssuesList)
  }
  
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    if searchText.isEmpty {
      updateData(on: issuesListViewModel.isssuesList)
    }
  }
  
}

