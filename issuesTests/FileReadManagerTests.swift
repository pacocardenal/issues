//
//  FileReadManagerTests.swift
//  issuesTests
//
//  Created by Paco Cardenal on 25/10/21.
//

import XCTest
@testable import issues

class FileReadManagerTests: XCTestCase {
  
  private enum Constants {
    static let fileContentOK = """
      \"First name\",\"Sur name\",\"Issue count\",\"Date of birth\"\r\n\"Theo\",\"Jansen\",5,\"1978-01-02T00:00:00\"\r\n\"Fiona\",\"de Vries\",7,\"1950-11-12T00:00:00\"\r\n\"Petra\",\"Boersma\",1,\"2001-04-20T00:00:00\"
      """
    static let fileContentEmpty = ""
  }
  
  private var sut: FileReadManager!
  
  override func setUpWithError() throws {
    try super.setUpWithError()
    sut = FileReadManager.shared
  }
  
  override func tearDownWithError() throws {
    sut = nil
    try super.tearDownWithError()
  }
  
  func testFileManagerIsNotNil() {
    XCTAssertNotNil(sut)
  }
  
  func testReadValidFilePath_isNotEmpty() {
    let filePath = Bundle.main.path(forResource: SourceFile.fileName, ofType: SourceFile.fileExtension)
    
    let content = try! sut.readData(from: filePath!)
    
    XCTAssertNotEqual(content, Constants.fileContentEmpty)
  }
  
  func testReadValidFilePath_isEqualToValidContent() {
    let filePath = Bundle.main.path(forResource: SourceFile.fileName, ofType: SourceFile.fileExtension)
    
    let content = try! sut.readData(from: filePath!)
    
    XCTAssertEqual(content, Constants.fileContentOK)
  }
  
  func testReadInvalidFilePath_isEqualToNil() {
    let filePath = Bundle.main.path(forResource: SourceFile.fileName, ofType: SourceFile.fileName)
    
    XCTAssertNil(filePath)
  }
  
}
