//
//  NavigationController.swift
//  JLTest
//
//  Created by Alejandro Barros Cuetos on 07/03/2017.
//  Copyright © 2017 Filtercode Ltd. All rights reserved.
//

import UIKit

/// Custom implementation of UINavigationController to allow
/// for bespoke behavior and look&feel
final class NavigationController: UINavigationController {
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
  }
  
  override init(rootViewController: UIViewController) {
    super.init(navigationBarClass: NavigationBar.self, toolbarClass: UIToolbar.self)
    viewControllers = [rootViewController]
  }
  
  init() {
    super.init(navigationBarClass: NavigationBar.self, toolbarClass: UIToolbar.self)
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(navigationBarClass: NavigationBar.self, toolbarClass: UIToolbar.self)
  }
  
  override var prefersStatusBarHidden: Bool {
    return false
  }
  
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .default
  }
  
  override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
    return .fade
  }
}
