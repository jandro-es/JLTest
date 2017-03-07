//
//  JsonObject.swift
//  JLTest
//
//  Created by Alejandro Barros Cuetos on 07/03/2017.
//  Copyright © 2017 Filtercode Ltd. All rights reserved.
//

import Foundation

/// Alias to define a Json object
public typealias Json = [String:AnyObject]
/// Alias to define a collection of Json objects
public typealias JsonCollection = [Json]

/// Protocol for objects represented by a Json object
protocol JsonObject {
  /// Failable initializer which gets an optional Json object representation
  init?(json: Json?)
}

/// Protocol for objects that can be in a collectin of Json objects
protocol JsonCollectionObject {
  
  /// Static method of objects which complies with JsonCollectionObject protocol.
  /// It creates a collection of JsonObjects
  ///
  /// - Parameter jsonCollection: The JsonCollection object to map
  /// - Returns: A collection of JsonObjects
  /// - Throws: An error in case the mapping fails
  static func collection(_ jsonCollection: JsonCollection) throws -> [JsonObject]
}
