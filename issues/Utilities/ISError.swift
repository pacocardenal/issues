//
//  ISError.swift
//  issues
//
//  Created by Paco Cardenal on 13/10/21.
//

import Foundation

enum ISError: String, Error {
  case invalidFile = "Unable to load data from file. Please check the file name."
  case invalidData = "The data loaded from file was invalid. Please try again."
  case unknown = "Unknown error. Please try again."
}
