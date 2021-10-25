//
//  FileManagerTests.swift
//  issuesTests
//
//  Created by Paco Cardenal on 25/10/21.
//

import XCTest
@testable import issues

class FileManagerTests: XCTestCase {
  
  private var sut: issues.IssuesFileManager!
  
  override func setUpWithError() throws {
    try super.setUpWithError()
    sut = FileManager.shared
  }
  
  override func tearDownWithError() throws {
    sut = nil
    try super.tearDownWithError()
  }
  
  func testFileManagerIsNotNil() {
    XCTAssertNotNil(sut)
  }
  
}
