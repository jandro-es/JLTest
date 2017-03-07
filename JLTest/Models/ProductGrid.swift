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
    static let rootKey = "products"
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
    self.image = image
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

extension ProductGrid {
  
  /// Resource to fetch the data of a collection of ProductGrid
  ///
  /// - Parameters:
  ///   - host: The host to use
  ///   - appKey: The AppKey
  ///   - transportType: The transport type for the resource
  /// - Returns: The resource for the line collection
  static func all(host: String, appKey: String) -> Resource<[ProductGrid]> {
    return Resource<[ProductGrid]>(urlRequest: try! ProductGridRouter.all(host, appKey).asURLRequest(), parseJson: parseJson)
  }
  
  /// Maps Data to a collection of ProductGrid
  static let parseJson: (Data) -> [ProductGrid]? = { data in
    guard
      let dictionary = try? JSONSerialization.jsonObject(with: data, options: []) as? Json,
      let jsonCollection = dictionary?[ProductGrid.DataKeys.rootKey] as? JsonCollection
      else {
        return nil
    }
    var products = [ProductGrid]()
    for json in jsonCollection {
      if let product = ProductGrid(json: json) {
        products.append(product)
      }
    }
    return products
  }
}

func == (lhs: ProductGrid, rhs: ProductGrid) -> Bool {
  return lhs.id == rhs.id
}
