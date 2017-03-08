//
//  Product.swift
//  JLTest
//
//  Created by Alejandro Barros Cuetos on 07/03/2017.
//  Copyright © 2017 Filtercode Ltd. All rights reserved.
//

import Foundation

struct ProductGrid: JsonObject {
  
  let id: String
  let title: String
  let price: String
  let image: String
  
  fileprivate struct DataKeys {
    static let id = "productId"
    static let title = "title"
    static let price = "price"
    static let priceNow = "now"
    static let image = "image"
  }
  
  init?(json: Json?) {
    guard let json = json,
      let id = json[DataKeys.id] as? String,
      let title = json[DataKeys.title] as? String,
      let prices = json[DataKeys.price] as? Json,
      let price = prices[DataKeys.priceNow] as? String,
      let image = json[DataKeys.image] as? String
      else {
        return nil
    }
    self.id = id
    self.title = title
    self.price = price
    self.image = "https:\(image)"
  }
}

extension ProductGrid: CustomStringConvertible, CustomDebugStringConvertible {
  var description: String {
    return "ProductGrid:\nid: \(id)\ntitle: \(title)\nprice: \(price)\nimage: \(image)\n\n"
  }
  
  var debugDescription: String {
    return "ProductGrid:\nid: \(id)\ntitle: \(title)\nprice: \(price)\nimage: \(image)\n\n"
  }
}

func == (lhs: ProductGrid, rhs: ProductGrid) -> Bool {
  return lhs.id == rhs.id
}
