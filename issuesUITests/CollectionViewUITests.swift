//
//  CollectionViewUITests.swift
//  issuesUITests
//
//  Created by Paco Cardenal on 27/10/21.
//

import XCTest

class CollectionViewUITests: XCTestCase {
  
  // MARK: - Enums
  private enum Constants {
    static let dummyText = "petra"
    static let navigationBarId = "Issues"
    static let searchFieldId = "Search"
    static let cancelButtonId = "Cancel"
    static let clearButtonId = "Clear text"
    static let defaultCellNumber = 3
    static let oneResultCellNumber = 1
  }
  
  // MARK: - Properties
  private var app: XCUIApplication!
  
  // MARK: - Setup
  override func setUpWithError() throws {
    try super.setUpWithError()
    app = XCUIApplication()
    app.launch()
    continueAfterFailure = false
  }
  
  override func tearDownWithError() throws {
    app = nil
    try super.tearDownWithError()
  }
  
  // MARK: - Tests
  func testCollectionView_numberOfCells_isEqualTo_defaultCellNumber() {
    let collectionView = app.collectionViews
    let cellCount = collectionView.children(matching: .cell).count
    
    XCTAssertEqual(cellCount, Constants.defaultCellNumber)
    
  }
  
  func testCollectionView_numberOfCells_isEqualToOne_oneResultOnSearchText() {
    let issuesNavigationBar = app.navigationBars[Constants.navigationBarId]
    let issuesSearchField = issuesNavigationBar.searchFields[Constants.searchFieldId]
    let collectionView = app.collectionViews
    
    issuesSearchField.tap()
    issuesSearchField.typeText(Constants.dummyText)
    
    let cellCount = collectionView.children(matching: .cell).count
    XCTAssertEqual(cellCount, Constants.oneResultCellNumber)
  }
  
}
