//
//  ProductGridCollection.swift
//  JLTest
//
//  Created by Alejandro Barros Cuetos on 08/03/2017.
//  Copyright © 2017 Filtercode Ltd. All rights reserved.
//

import Foundation

struct ProductGridCollection: JsonObject {
  
  let gridInfo: ProductGridInfo
  let products: [ProductGrid]
  
  fileprivate struct DataKeys {
    static let productsKey = "products"
  }
  
  init?(json: Json?) {
    guard let json = json,
      let productsJson = json[ProductGridCollection.DataKeys.productsKey] as? JsonCollection,
      let productInfo = ProductGridInfo(json: json)
      else {
        return nil
    }
    var prods = [ProductGrid]()
    for jsonProduct in productsJson {
      if let product = ProductGrid(json: jsonProduct) {
        prods.append(product)
      }
    }
    self.gridInfo = productInfo
    self.products = prods
  }
}

extension ProductGridCollection {
  
  /// Resource to fetch the data from a collection of ProductGrid
  ///
  /// - Parameters:
  ///   - host: The host to use
  ///   - appKey: The AppKey
  ///   - transportType: The transport type for the resource
  /// - Returns: The resource for the ProductGridCollection collection
  static func all(host: String, appKey: String) -> Resource<ProductGridCollection> {
    return Resource<(ProductGridCollection)>(urlRequest: try! ProductGridRouter.all(host, appKey).asURLRequest(), parseJson: parseJson)
  }
  
  /// Maps Data to a collection of ProductGrid
  static let parseJson: (Data) -> ProductGridCollection? = { data in
    guard
      let jsonData = try? JSONSerialization.jsonObject(with: data, options: []) as? Json
      else {
        return nil
    }
    return ProductGridCollection(json: jsonData)
  }
}
