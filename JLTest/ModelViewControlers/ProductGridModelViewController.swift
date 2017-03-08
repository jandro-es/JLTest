//
//  ProductGridModelViewController.swift
//  JLTest
//
//  Created by Alejandro Barros Cuetos on 08/03/2017.
//  Copyright © 2017 Filtercode Ltd. All rights reserved.
//

import UIKit

final class ProductGridModelViewController {
  
  fileprivate let apiService: ApiService!
  
  init(_ apiService: ApiService) {
    self.apiService = apiService
  }
  
  /// Gets the product grid items from the proper endpoint
  ///
  /// - Parameter completionHandler: Completion handler call after request finished
  func fetchAll(completionHandler: @escaping (ApiError?, ProductGridCollection?) -> Void) {
    UIApplication.shared.isNetworkActivityIndicatorVisible = true
    apiService.load(ProductGridCollection.all(host: apiService.host, appKey: Config.apiKey)) { (result) in
      UIApplication.shared.isNetworkActivityIndicatorVisible = false
      if let error = result.error {
        completionHandler(ApiError.other(error: error as NSError?), nil)
      } else {
        guard let collection = result.value else {
          completionHandler(ApiError.badResponse, nil)
          return
        }
        completionHandler(nil, collection)
      }
    }
  }
}
