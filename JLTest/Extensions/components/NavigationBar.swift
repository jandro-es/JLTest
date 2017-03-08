//
//  NavigationBar.swift
//  JLTest
//
//  Created by Alejandro Barros Cuetos on 07/03/2017.
//  Copyright © 2017 Filtercode Ltd. All rights reserved.
//

import UIKit

/// Custom UINavigationBar allowing for customization
final class NavigationBar: UINavigationBar {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    commonInit()
  }
  
  override func sizeThatFits(_ size: CGSize) -> CGSize {
    return CGSize(width: bounds.width, height: 75)
  }
  
  private func commonInit() {
    barTintColor = UIColor.jlNavigationBar
    tintColor = .white
    titleTextAttributes = ([NSFontAttributeName: UIFont.latoMedium(of: UIFont.FontSize.title), NSForegroundColorAttributeName: UIColor.jlTextGray])
    setTitleVerticalPositionAdjustment(-15.0, for: UIBarMetrics.default)
  }
}
