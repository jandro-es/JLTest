//
//  ApiService.swift
//  JLTest
//
//  Created by Alejandro Barros Cuetos on 07/03/2017.
//  Copyright © 2017 Filtercode Ltd. All rights reserved.
//

import Foundation
import Alamofire
import CFNetwork

enum HTTPMethod<Body> {
  case get
  case post(Body)
  case head
}

extension HTTPMethod {
  var method: String {
    switch self {
    case .get:
      return "GET"
    case .post:
      return "POST"
    case .head:
      return "HEAD"
    }
  }
  
  func map<D>(_ mappingFunction: (Body) -> D) -> HTTPMethod<D> {
    switch self {
    case .get: return .get
    case .post(let body):
      return .post(mappingFunction(body))
    case .head: return .head
    }
  }
}

final class ApiService {
  
  /// Possible CFNetwork errors for failed connections
  static let connectionErrors = [
    CFNetworkErrors.cfurlErrorNotConnectedToInternet,
    CFNetworkErrors.cfurlErrorTimedOut,
    CFNetworkErrors.cfurlErrorCannotFindHost,
    CFNetworkErrors.cfurlErrorCannotConnectToHost,
    CFNetworkErrors.cfurlErrorNetworkConnectionLost,
    CFNetworkErrors.cfurlErrorDNSLookupFailed,
    CFNetworkErrors.cfurlErrorResourceUnavailable,
    CFNetworkErrors.cfurlErrorNotConnectedToInternet
  ]
  
  /// Public properties
  var host: String!
  
  /// Private properties
  fileprivate var manager: Alamofire.SessionManager
  
  init(host: String) {
    self.host = host
    self.manager = Alamofire.SessionManager(configuration: URLSessionConfiguration.default)
  }
  
  // MARK: - Static methods
  
  /// Parses the received error to an ApiError that the app will know how to handle
  ///
  /// - Parameters:
  ///   - error: The Error base object
  ///   - statusCode: The status code of the response
  /// - Returns: An ApiError
  static func parseError(error: Error?, statusCode: Int?) -> ApiError {
    if let error = error {
      if let cause = (error as NSError).userInfo[NSUnderlyingErrorKey] as? NSError, cause.domain == (kCFErrorDomainCFNetwork as String) {
        if let networkCode = CFNetworkErrors(rawValue: Int32(cause.code)), connectionErrors.contains(networkCode) {
          return ApiError.noNetwork
        }
      }
    }
    switch statusCode {
    case .some(401):
      return ApiError.unAuthorized
    case .some(403):
      return ApiError.forbidden
    case .some(400 ... 499):
      return ApiError.badRequest
    case .some(500 ... 599):
      return ApiError.serverError
    default:
      return ApiError.unknown
    }
  }
  
  /// Loads a remote endpoint and parses the response
  ///
  /// - Parameters:
  ///   - resource: The resource
  ///   - completion: Completion handler
  func load<T>(_ resource: Resource<T>, completion: @escaping (Result<T>) -> Void) {
    manager.request(resource.urlRequest).responseData { (dataResponse) in
      if dataResponse.result.isSuccess {
        guard let data = dataResponse.result.value else {
          DispatchQueue.main.async {
            completion(Result<T>(nil, or: ApiError.badResponse))
          }
          return
        }
        let parsed = resource.parse(data)
        let result = Result<T>(parsed, or: ApiService.parseError(error: dataResponse.result.error, statusCode: dataResponse.response?.statusCode))
        DispatchQueue.main.async {
          completion(result)
        }
      } else {
        DispatchQueue.main.async {
          completion(Result<T>(nil, or: ApiService.parseError(error: dataResponse.result.error, statusCode: dataResponse.response?.statusCode)))
        }
      }
    }
  }
}
