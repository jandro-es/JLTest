//
//  Result.swift
//  JLTest
//
//  Created by Alejandro Barros Cuetos on 07/03/2017.
//  Copyright © 2017 Filtercode Ltd. All rights reserved.
//

import Foundation

/// Result object to encapsulate the result of a Resource request
///
/// - success: Case for a successfull request
/// - failure: Case for a failure request
enum Result<T> {
  case success(T)
  case failure(Error)
}

extension Result {
  /// Creates an instance of Result using the value and/or error passed
  ///
  /// - parameter value: The possible value of the result object
  /// - parameter error: The possible error of the result object
  ///
  /// - returns: An instance of Result
  init(_ value: T?, or error: Error) {
    if let value = value {
      self = .success(value)
    } else {
      self = .failure(error)
    }
  }
  
  /// Extracts the value of the result
  var value: T? {
    guard case .success(let val) = self else {
      return nil
    }
    return val
  }
  
  /// Extracts the error of the resutl
  var error: Error? {
    guard case .failure(let error) = self else {
      return nil
    }
    return error
  }
}
