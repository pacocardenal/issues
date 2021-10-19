//
//  IssueTests.swift
//  issuesTests
//
//  Created by Paco Cardenal on 19/10/21.
//

import XCTest
@testable import issues

class IssueTests: XCTestCase {
  
  private enum MockData {
    static let firstName = "Theo"
    static let lastName = "Jansen"
    static let issuesCount = "5"
    static let birthDate = "1978-01-02T00:00:00"
  }
  
  var row: [String?]!
  var sut: Issue!
  
  override func setUpWithError() throws {
    try super.setUpWithError()
    row = [MockData.firstName, MockData.lastName, MockData.issuesCount, MockData.birthDate]
    sut = Issue(row: row)
  }
  
  override func tearDownWithError() throws {
    row = nil
    sut = nil
    try super.tearDownWithError()
  }
  
  func testIssueFirstNameIsEqualToRowFirstElement() {
    XCTAssertEqual(sut.firstName, row[0])
  }
  
  func testRowNilFirstElementReturnsIssueFirstnameEmptyValue() {
    row[0] = nil
    
    sut = Issue(row: row)
    
    XCTAssertEqual(sut.firstName, "")
  }
  
  func testIssueLastNameIsEqualToRowSecondElement() {
    XCTAssertEqual(sut.lastName, row[1])
  }
  
  func testRowNilSecondElementReturnsIssueLastnameEmptyValue() {
    row[1] = nil
    
    sut = Issue(row: row)
    
    XCTAssertEqual(sut.lastName, "")
  }
  
  func testIssueIssuesCountIsEqualToRowThirdElement() {
    let issuesCount = row[2]!
    
    XCTAssertEqual(sut.issuesCount, Int(issuesCount))
  }
  
  func testRowNilThirdElementReturnsIssueIssuesCountEmptyValue() {
    row[2] = nil
    
    sut = Issue(row: row)
    
    XCTAssertEqual(sut.issuesCount, 0)
  }
  
  func testIssueDateOfBirthIsEqualToRowFourthElement() {
    XCTAssertEqual(sut.dateOfBirth, row[3])
  }
  
  func testRowNilFourthElementReturnsIssueDateOfBirthEmptyValue() {
    row[3] = nil
    
    sut = Issue(row: row)
    
    XCTAssertEqual(sut.dateOfBirth, "")
  }
  
  func testAllNilRowReturnsNilIssue() {
    row = [nil, nil, nil, nil]
    
    sut = Issue(row: row)
    
    XCTAssertEqual(sut, nil)
  }
  
  func testRowWithThreeFieldsReturnsNilIssue() {
    row = [MockData.firstName, MockData.lastName, MockData.issuesCount]
    
    sut = Issue(row: row)
    
    XCTAssertEqual(sut, nil)
  }
  
  func testRowWithFiveFieldsReturnsNilIssue() {
    row = [MockData.firstName, MockData.lastName, MockData.issuesCount, MockData.birthDate, MockData.birthDate]
    
    sut = Issue(row: row)
    
    XCTAssertEqual(sut, nil)
  }
  
}
