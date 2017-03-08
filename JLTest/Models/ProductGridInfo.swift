//
//  ProductGridInfo.swift
//  JLTest
//
//  Created by Alejandro Barros Cuetos on 08/03/2017.
//  Copyright © 2017 Filtercode Ltd. All rights reserved.
//

import Foundation

struct ProductGridInfo: JsonObject {
  let results: Int
  let pages: Int
  
  fileprivate struct DataKeys {
    static let results = "results"
    static let pages = "pagesAvailable"
  }
  
  init?(json: Json?) {
    guard let json = json,
      let results = json[DataKeys.results] as? Int,
      let pages = json[DataKeys.pages] as? Int
      else {
        return nil
    }
    self.results = results
    self.pages = pages
  }
}

extension ProductGridInfo: CustomStringConvertible, CustomDebugStringConvertible {
  var description: String {
    return "ProductGridInfo:\nresults: \(results)\npages: \(pages)\n\n"
  }
  
  var debugDescription: String {
    return "ProductGridInfo:\nresults: \(results)\npages: \(pages)\n\n"
  }
}
