//
//  ProductGridTests.swift
//  JLTest
//
//  Created by Alejandro Barros Cuetos on 07/03/2017.
//  Copyright © 2017 Filtercode Ltd. All rights reserved.
//

import XCTest
@testable import JLTest

class ProductGridTests: XCTestCase {
    
  static let host = "https://api.johnlewis.com/v1"
  static let key = "Wu1Xqn3vNrd1p7hqkvB6hEu0G9OrsYGb"
  
  var asyncExpectation: XCTestExpectation?
  var apiService = ApiService(host: host)
  
  override func setUp() {
    super.setUp()
    
  }
  
  override func tearDown() {
    super.tearDown()
  }
  
  func testAllProductGrid() {
    asyncExpectation = expectation(description: "Get all product grid expectation")
    apiService.load(ProductGridCollection.all(host: apiService.host, appKey: ProductGridTests.key)) { (result) in
      if let error = result.error {
        XCTFail("product grid all error: \(error)")
      } else {
        guard let productsCollection = result.value else {
          XCTFail("No products")
          return
        }
        debugPrint(productsCollection)
        XCTAssert(productsCollection.products.count == 20)
        XCTAssert(productsCollection.gridInfo.results != 0)
        self.asyncExpectation?.fulfill()
      }
    }
    waitForExpectations(timeout: 5.0) { (error) -> Void in
      if error != nil {
        XCTFail("Error while waiting expectation: \(error?.localizedDescription)")
      }
    }
  }
}
