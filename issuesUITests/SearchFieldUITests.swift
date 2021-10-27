//
//  SearchFieldUITests.swift
//  SearchFieldUITests
//
//  Created by Paco Cardenal on 26/10/21.
//

import XCTest

class SearchFieldUITests: XCTestCase {
  
  // MARK: - Enums
  private enum Constants {
    static let dummyText = "petra"
    static let navigationBarId = "Issues"
    static let searchFieldId = "Search"
    static let cancelButtonId = "Cancel"
    static let clearButtonId = "Clear text"
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
  func testSearchField_isEnabled() {
    let issuesNavigationBar = app.navigationBars[Constants.navigationBarId]
    let issuesSearchField = issuesNavigationBar.searchFields[Constants.searchFieldId]
    
    XCTAssert(issuesSearchField.isEnabled)
  }
  
  func testSearchField_cancelButton_isEnabled() {
    let issuesNavigationBar = app.navigationBars[Constants.navigationBarId]
    let issuesSearchField = issuesNavigationBar.searchFields[Constants.searchFieldId]
    
    issuesSearchField.tap()
    let cancelButton = issuesNavigationBar.buttons[Constants.cancelButtonId]
   
    XCTAssert(cancelButton.isEnabled)
  }
  
  func testSearchField_clearTextButton_isEnabled() {
    let issuesNavigationBar = app.navigationBars[Constants.navigationBarId]
    let issuesSearchField = issuesNavigationBar.searchFields[Constants.searchFieldId]
    
    issuesSearchField.tap()
    issuesSearchField.typeText(Constants.dummyText)
    
    let clearTextButton = issuesSearchField.buttons[Constants.clearButtonId]
    XCTAssert(clearTextButton.isEnabled)
  }
  
  func testSearchField_canWriteOn() {
    let issuesNavigationBar = app.navigationBars[Constants.navigationBarId]
    let issuesSearchField = issuesNavigationBar.searchFields[Constants.searchFieldId]
    
    issuesSearchField.tap()
    issuesSearchField.typeText(Constants.dummyText)
    
    XCTAssertEqual((issuesSearchField.value as! String), Constants.dummyText)
  }
  
  func testSearchField_canCancel() {
    let issuesNavigationBar = app.navigationBars[Constants.navigationBarId]
    let issuesSearchField = issuesNavigationBar.searchFields[Constants.searchFieldId]
    
    issuesSearchField.tap()
    issuesSearchField.typeText(Constants.dummyText)
    let cancelButton = issuesNavigationBar.buttons[Constants.cancelButtonId]
    cancelButton.tap()
    
    XCTAssertEqual((issuesSearchField.value as! String), issuesSearchField.placeholderValue)
  }
  
  func testSearchField_canClearText() {
    let issuesNavigationBar = app.navigationBars[Constants.navigationBarId]
    let issuesSearchField = issuesNavigationBar.searchFields[Constants.searchFieldId]
    
    issuesSearchField.tap()
    issuesSearchField.typeText(Constants.dummyText)
    issuesSearchField.buttons[Constants.clearButtonId].tap()
    
    XCTAssertEqual((issuesSearchField.value as! String), issuesSearchField.placeholderValue)
  }
  
}
