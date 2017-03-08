//
//  Config.swift
//  JLTest
//
//  Created by Alejandro Barros Cuetos on 07/03/2017.
//  Copyright © 2017 Filtercode Ltd. All rights reserved.
//

import Foundation

/// Class to handle all configuration values
final class Config {
  
  fileprivate static let apiHostKey = "apiHost"
  fileprivate static let apiKeyKey = "apiKey"
  
  static var apiHost: String {
    if let apiHost = Bundle.main.infoDictionary?[apiHostKey] as? String {
      return apiHost
    }
    fatalError("The app needs the key <<\(apiHostKey)>> to start")
  }
  
  static var apiKey: String {
    if let key = Bundle.main.infoDictionary?[apiKeyKey] as? String {
      return key
    }
    fatalError("The app needs the key <<\(apiKeyKey)>> to start")
  }
}
