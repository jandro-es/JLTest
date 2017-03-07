//
//  ApiError.swift
//  JLTest
//
//  Created by Alejandro Barros Cuetos on 07/03/2017.
//  Copyright © 2017 Filtercode Ltd. All rights reserved.
//

import Foundation

/// Api error type
///
/// - noNetwork:    The request did not have available network
/// - serverError:  The server has returned a 500 error
/// - badRequest:   The server has returned a 400 error
/// - unAuthorized: The server has returned a 401 error
/// - forbidden:    The server has returned a 403 error
/// - other:        Not specific error, it will contain an NSError object
/// - unknown:      Not defined error
/// - badResponse:  The response is not a Json object or the mapping failed
/// - persistError: An error happened while trying to persis the object
enum ApiError: Error {
  case noNetwork
  case serverError
  case badRequest
  case unAuthorized
  case forbidden
  case other(error: NSError?)
  case unknown
  case badResponse
  case persistError
}
