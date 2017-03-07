//
//  AppDelegate.swift
//  JLTest
//
//  Created by Alejandro Barros Cuetos on 07/03/2017.
//  Copyright © 2017 Filtercode Ltd. All rights reserved.
//

import UIKit
import Firebase
import Fabric
import Crashlytics

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  fileprivate var mainCoordinator: MainCoordinator!
  fileprivate var apiService: ApiService!
  fileprivate var navigationController: UINavigationController!

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    
    startExternalServices()
    startInternalServices()
    
    window = UIWindow(frame: UIScreen.main.bounds)
    navigationController = NavigationController()
    window!.rootViewController = navigationController
    mainCoordinator = MainCoordinator(parameters: RootCoordinatorParameterBag(apiService, window!))
    mainCoordinator.start()
    
    window!.makeKeyAndVisible()
    
    return true
  }
  
  private func startExternalServices() {
    // Firebase
    FIRApp.configure()
    // Fabric
    Fabric.with([Crashlytics.self])
  }
  
  private func startInternalServices() {
    apiService = ApiService(host: "https://api.tfl.gov.uk")
  }
}
