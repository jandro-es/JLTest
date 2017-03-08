//
//  ProductsCoordinator.swift
//  JLTest
//
//  Created by Alejandro Barros Cuetos on 07/03/2017.
//  Copyright © 2017 Filtercode Ltd. All rights reserved.
//

import UIKit

final class ProductsCoordinator: RootViewControllerCoordinator {
  
  internal var apiService: ApiService!
  internal var window: UIWindow?
  
  var navigationController: NavigationController!
  
  init(parameters: CoordinatorParameterBag) {
    self.apiService = parameters.apiService
    self.window = nil
  }
  
  init(parameters: RootCoordinatorParameterBag) {
    self.apiService = parameters.apiService
    self.window = parameters.window
  }

  func start() {
    guard let productGridVc = UIStoryboard(name: "ProductsStoryboard", bundle: nil).instantiateInitialViewController() else {
      fatalError("Error while instantiateInitialViewController")
    }
    let modelViewController = ProductGridModelViewController(apiService)
    (productGridVc as! ProductGridViewController).modelViewController = modelViewController
    navigationController = NavigationController(rootViewController: productGridVc)
    switchWindowRootViewController(navigationController)
  }
}
