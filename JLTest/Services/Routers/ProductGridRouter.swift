//
//  ProductGridRouter.swift
//  JLTest
//
//  Created by Alejandro Barros Cuetos on 07/03/2017.
//  Copyright © 2017 Filtercode Ltd. All rights reserved.
//

import Foundation
import Alamofire

enum ProductGridRouter {
  
  case all(String, String)
  
  var path: String {
    switch self {
    case .all(_, _):
      return "/products/search"
    }
  }
  
  var host: String {
    switch self {
    case .all(let host, _):
      return host
    }
  }
  
  var method: HTTPMethod<Data> {
    switch self {
    case .all(_, _):
      return .get
    }
  }
  
  func asURLRequest() throws -> URLRequest {
    let URL = Foundation.URL(string: host)!
    let mutableURLRequest = NSMutableURLRequest(url: URL.appendingPathComponent(path))
    mutableURLRequest.httpMethod = method.method
    
    mutableURLRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
    mutableURLRequest.setValue("application/json", forHTTPHeaderField: "Accept")
    
    switch self {
    case .all(_, let appKey):
      return try URLEncoding.default.encode(mutableURLRequest as URLRequest, with: ["q": "dishwasher", "key": appKey, "pageSize": "20"]) as Foundation.URLRequest
    }
  }
}
