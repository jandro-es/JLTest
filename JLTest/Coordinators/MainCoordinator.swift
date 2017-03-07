//
//  MainCoordinator.swift
//  JLTest
//
//  Created by Alejandro Barros Cuetos on 07/03/2017.
//  Copyright © 2017 Filtercode Ltd. All rights reserved.
//

import UIKit

/// Main coordinator of the application, started on app start up
final class MainCoordinator: RootViewControllerCoordinator {
  
  internal var apiService: ApiService!
  internal var window: UIWindow?
  
  var rootViewControllerCoordinator: RootViewControllerCoordinator?
  
  init(parameters: CoordinatorParameterBag) {
    self.apiService = parameters.apiService
    self.window = nil
  }
  
  init(parameters: RootCoordinatorParameterBag) {
    self.apiService = parameters.apiService
    self.window = parameters.window
  }
  
  func start() {
    presentProductsCoordinator()
  }
  
  fileprivate func presentProductsCoordinator() {

  }
}
