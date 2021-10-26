//
//  FileIssuesManagerTests.swift
//  issuesTests
//
//  Created by Paco Cardenal on 26/10/21.
//

import XCTest
@testable import issues

class FileIssuesManagerTests: XCTestCase {
  
  // MARK: - Enums
  private enum Constants {
    static let orderedIssues = [Issue(firstName: "1 One First", lastName: "One Last", issuesCount: 1, dateOfBirth: "1978-01-02T00:00:00"),
                                Issue(firstName: "2 Two First", lastName: "Two Last", issuesCount: 2, dateOfBirth: "1950-11-12T00:00:00"),
                                Issue(firstName: "3 Three First", lastName: "Three Last", issuesCount: 3, dateOfBirth: "2001-04-20T00:00:00")]
    static let unorderedIssues = [Issue(firstName: "1 One First", lastName: "One Last", issuesCount: 1, dateOfBirth: "1978-01-02T00:00:00"),
                                  Issue(firstName: "3 Three First", lastName: "Three Last", issuesCount: 3, dateOfBirth: "2001-04-20T00:00:00"),
                                  Issue(firstName: "2 Two First", lastName: "Two Last", issuesCount: 2, dateOfBirth: "1950-11-12T00:00:00")]
  }
  
  // MARK: - Properties
  private var sut: FileIssuesManager!
  
  // MARK: - Setup
  override func setUpWithError() throws {
    try super.setUpWithError()
    sut = FileIssuesManager.shared
  }
  
  override func tearDownWithError() throws {
    sut = nil
    try super.tearDownWithError()
  }
  
  // MARK: - Tests
  func testMockOrdererIssues_areEqualTo_fileIssuesManagerIssues() {
    let mockFileTypeManager = MockFileTypeManager(issues: Constants.orderedIssues)
    let mockIssues = mockFileTypeManager.read(content: "")
    sut.getIssues(withFileTypeManager: mockFileTypeManager) { result in
      switch result {
      case .success(let issues):
        XCTAssertEqual(issues, mockIssues)
      case .failure(_):
        XCTFail()
      }
    }
  }
  
  func testMockUnordererIssues_areNotEqualTo_fileIssuesManagerIssues() {
    let mockFileTypeManager = MockFileTypeManager(issues: Constants.unorderedIssues)
    let mockIssues = mockFileTypeManager.read(content: "")
    sut.getIssues(withFileTypeManager: mockFileTypeManager) { result in
      switch result {
      case .success(let issues):
        XCTAssertNotEqual(issues, mockIssues)
      case .failure(_):
        XCTFail()
      }
    }
  }
  
  func testMockUnordererIssuesSorted_areEqualTo_fileIssuesManagerIssues() {
    let mockFileTypeManager = MockFileTypeManager(issues: Constants.unorderedIssues)
    let mockIssues = mockFileTypeManager.read(content: "")
    sut.getIssues(withFileTypeManager: mockFileTypeManager) { result in
      switch result {
      case .success(let issues):
        XCTAssertEqual(issues, self.sort(mockIssues))
      case .failure(_):
        XCTFail()
      }
    }
  }
  
  func testMockEmptyIssues_areEqualTo_fileIssuesManagerEmptyIssues() {
    let mockFileTypeManager = MockFileTypeManager(issues: [Issue]())
    let mockIssues = mockFileTypeManager.read(content: "")
    sut.getIssues(withFileTypeManager: mockFileTypeManager) { result in
      switch result {
      case .success(let issues):
        XCTAssertEqual(issues, mockIssues)
      case .failure(_):
        XCTFail()
      }
    }
    
  }
  
  // MARK: - Private methods
  private func sort(_ issues: [Issue]) -> [Issue] {
    return issues.sorted(by: {
      if let firstFullName = $0.fullName, let secondFullName = $1.fullName {
        return firstFullName < secondFullName
      }
      return false
    })
  }
  
}
