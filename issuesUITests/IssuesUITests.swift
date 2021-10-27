//
//  IssuesUITests.swift
//  issuesUITests
//
//  Created by Paco Cardenal on 27/10/21.
//

import XCTest

class IssuesUITests: XCTestCase {

  // MARK: - Enums
  private enum Constants {
    static let navigationBarId = "Issues"
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
  func testApp_isLaunched() {
    XCTAssertEqual(app.state, XCUIApplication.State.runningForeground)
  }
  
  func testApp_has_navigationBar() {
    let issuesNavigationBar = XCUIApplication().navigationBars[Constants.navigationBarId]
    
    XCTAssert(issuesNavigationBar.exists)
  }

}
