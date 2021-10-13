//
//  ISError.swift
//  issues
//
//  Created by m_949184 on 13/10/21.
//

import Foundation

enum ISError: String, Error {
  case invalidFile = "Unable to load data from that file. Please check the file name."
  case invalidData = "The data loaded from the file was invalid. Please try again."
}
