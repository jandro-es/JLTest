//
//  Resource.swift
//  JLTest
//
//  Created by Alejandro Barros Cuetos on 07/03/2017.
//  Copyright © 2017 Filtercode Ltd. All rights reserved.
//

import Foundation

/// Defines a network Resource
struct Resource<T> {
  /// The NSURLRequest for the endpoint
  var urlRequest: URLRequest
  /// The parse function for the resource
  var parse: (Data) -> T?
}

extension Resource {
  
  /// Default initializer for a network resource
  ///
  /// - Parameters:
  ///   - urlRequest: The URLRequest matching the resource
  ///   - parseJson: The parsing function
  init(urlRequest: URLRequest, parseJson: @escaping (Data) -> T?) {
    self.urlRequest = urlRequest
    self.parse = { (data) in
      return parseJson(data)
    }
  }
}
