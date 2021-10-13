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
  var dataSource: UICollectionViewDiffableDataSource<Section, Issue>!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureViewController()
    configureCollectionView()
    configureDataSource()
    getIssues()
    
  }
  
  private func configureViewController() {
    view.backgroundColor = .systemBackground
    navigationController?.navigationBar.prefersLargeTitles = true
  }
  
  private func configureCollectionView() {
    collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createOneColumnFlowLayout())
    view.addSubview(collectionView)
    collectionView.backgroundColor = .systemBackground
    collectionView.register(IssueCell.self, forCellWithReuseIdentifier: IssueCell.reuseId)
  }
  
  private func createOneColumnFlowLayout() -> UICollectionViewFlowLayout {
    let width = view.bounds.width
    let padding: CGFloat = 12
    let availableWidth = width - (padding * 2)
    let itemWidth = availableWidth
    
    let flowLayout = UICollectionViewFlowLayout()
    flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
    flowLayout.itemSize = CGSize(width: itemWidth, height: 100)
    return flowLayout
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
  
  private func updateData() {
    var snapshot = NSDiffableDataSourceSnapshot<Section, Issue>()
    snapshot.appendSections([.main])
    snapshot.appendItems(issues)
    DispatchQueue.main.async {
      self.dataSource.apply(snapshot, animatingDifferences: true)
    }
  }
  
  private func getIssues() {
    FileManager.shared.getIssues { result in
      switch result {
      case .success(let issues):
        self.issues = issues
        self.updateData()
      case .failure(let error):
        self.presentISAlertOnMainThread(title: "Bad stuff happened",
                                        message: error.rawValue,
                                        buttonTitle: "Ok")
      }
    }
  }
  
}

