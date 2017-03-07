//
//  Coordinator.swift
//  JLTest
//
//  Created by Alejandro Barros Cuetos on 07/03/2017.
//  Copyright © 2017 Filtercode Ltd. All rights reserved.
//

import UIKit

/// Object to pack the parameters and services needed for Coordinator
class CoordinatorParameterBag {
  
  var apiService: ApiService!
  
  init(_ apiService: ApiService) {
    self.apiService = apiService
  }
}

/// Object to pack the parameters and sercices needed for a RootCoordinator
class RootCoordinatorParameterBag: CoordinatorParameterBag {
  
  var window: UIWindow!
  
  init(_ apiService: ApiService, _ window: UIWindow) {
    super.init(apiService)
    self.window = window
  }
}

/// Protocol defining a coordinator
protocol Coordinator {
  var apiService: ApiService! { get set }
  
  init(parameters: CoordinatorParameterBag)
  
  func start()
}

/// Protocol defining a Root View Controller Coordinator
protocol RootViewControllerCoordinator: Coordinator {
  
  var window: UIWindow? { get set }
  
  init(parameters: RootCoordinatorParameterBag)
}

extension RootViewControllerCoordinator {
  
  /// Given a RootViewController animates the transition to the new controller
  ///
  /// - Parameter rootViewController: The target view controller
  func switchWindowRootViewController(_ rootViewController: UIViewController) {
    guard let window = window, let _ = window.rootViewController else {
      self.window?.rootViewController = rootViewController
      return
    }
    
    UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve, animations: {
      let oldState = UIView.areAnimationsEnabled
      UIView.setAnimationsEnabled(false)
      self.window?.rootViewController = rootViewController
      UIView.setAnimationsEnabled(oldState)
    }, completion: nil)
  }
}
