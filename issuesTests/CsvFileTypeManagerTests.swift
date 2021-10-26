//
//  CsvFileTypeManagerTests.swift
//  issuesTests
//
//  Created by Paco Cardenal on 25/10/21.
//

import XCTest
@testable import issues

class CsvFileTypeManagerTests: XCTestCase {
  
  // MARK: - Enums
  private enum Constants {
    static let fileContentOK = """
      \"First name\",\"Sur name\",\"Issue count\",\"Date of birth\"\r\n\"Theo\",\"Jansen\",5,\"1978-01-02T00:00:00\"\r\n\"Fiona\",\"de Vries\",7,\"1950-11-12T00:00:00\"\r\n\"Petra\",\"Boersma\",1,\"2001-04-20T00:00:00\"
      """
    static let fileContentEmpty = ""
    static let fileContentMalformed = "abc"
    static let fileContentMixed = """
      \"First name\",\"Sur name\",\"Issue count\",\"Date of birth\"\r\n\"Theo\",\"Jansen\",5,\"1978-01-02T00:00:00\"\r\n\"Fiona\",\"de
      """
    static let issues = [Issue(firstName: "Theo", lastName: "Jansen", issuesCount: 5, dateOfBirth: "1978-01-02T00:00:00"),
                         Issue(firstName: "Fiona", lastName: "de Vries", issuesCount: 7, dateOfBirth: "1950-11-12T00:00:00"),
                         Issue(firstName: "Petra", lastName: "Boersma", issuesCount: 1, dateOfBirth: "2001-04-20T00:00:00")]
  }
  
  // MARK: - Properties
  private var sut: CsvFileTypeManager!
  
  // MARK: - Setup
  override func setUpWithError() throws {
    try super.setUpWithError()
    sut = CsvFileTypeManager.shared
  }
  
  override func tearDownWithError() throws {
    sut = nil
    try super.tearDownWithError()
  }
  
  // MARK: - Tests
  func testCsvFileTypeManagerIsNotNil() {
    XCTAssertNotNil(sut)
  }
  
  func testReadValidCsvFileCount_isEqualToMockContentCount() {
    let issues = sut.read(content: Constants.fileContentOK)
    XCTAssertEqual(issues.count, Constants.issues.count)
  }
  
  func testReadValidCsvFileContent_isEqualToMockContent() {
    let issues = sut.read(content: Constants.fileContentOK)
    
    for (index, _) in issues.enumerated() {
      XCTAssertEqual(issues[index], Constants.issues[index])
    }
  }
  
  func testReadEmptyCsvFileContent_isEqualToEmptyIssuesContent() {
    let issues = sut.read(content: Constants.fileContentEmpty)
    XCTAssertEqual(issues, [Issue]())
  }
  
  func testReadMalformedCsvFileContent_isEqualToEmptyIssuesContent() {
    let issues = sut.read(content: Constants.fileContentMalformed)
    XCTAssertEqual(issues, [Issue]())
  }
  
  func testReadMixedCsvFileContent_isEqualToOnlyValidContent() {
    let issues = sut.read(content: Constants.fileContentMixed)
    XCTAssertEqual(issues, [Constants.issues.first])
  }
}
