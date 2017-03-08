//
//  UIFont+Lato.swift
//  JLTest
//
//  Created by Alejandro Barros Cuetos on 08/03/2017.
//  Copyright © 2017 Filtercode Ltd. All rights reserved.
//

import UIKit

extension UIFont {
  
  enum FontSize: CGFloat {
    case title = 20.0
    case mediumText = 14.0
    case bigText = 16.0
  }
  
  static var variationSize: CGFloat {
    switch UIApplication.shared.preferredContentSizeCategory {
    case UIContentSizeCategory.extraSmall:
      return -6
    case UIContentSizeCategory.small:
      return -4
    case UIContentSizeCategory.medium:
      return -2
    case UIContentSizeCategory.large:
      return 0
    case UIContentSizeCategory.extraLarge:
      return 2
    case UIContentSizeCategory.extraExtraLarge:
      return 4
    case UIContentSizeCategory.extraExtraExtraLarge:
      return 6
    default:
      return 0
    }
  }
  
  static func latoSemibold(of size: FontSize, adjusted: Bool = true) -> UIFont {
    return UIFont(name: "Lato-Semibold", size: size.rawValue + (adjusted ? variationSize : 0))!
  }
  
  static func latoRegular(of size: FontSize, adjusted: Bool = true) -> UIFont {
    return UIFont(name: "Lato-Regular", size: size.rawValue + (adjusted ? variationSize : 0))!
  }
  
  static func latoHairline(of size: FontSize, adjusted: Bool = true) -> UIFont {
    return UIFont(name: "Lato-Hairline", size: size.rawValue + (adjusted ? variationSize : 0))!
  }
  
  static func latoThin(of size: FontSize, adjusted: Bool = true) -> UIFont {
    return UIFont(name: "Lato-Thin", size: size.rawValue + (adjusted ? variationSize : 0))!
  }
  
  static func latoHairlineItalic(of size: FontSize, adjusted: Bool = true) -> UIFont {
    return UIFont(name: "Lato-HairlineItalic", size: size.rawValue + (adjusted ? variationSize : 0))!
  }
  
  static func latoMedium(of size: FontSize, adjusted: Bool = true) -> UIFont {
    return UIFont(name: "Lato-Medium", size: size.rawValue + (adjusted ? variationSize : 0))!
  }
  
  static func latoThinItalic(of size: FontSize, adjusted: Bool = true) -> UIFont {
    return UIFont(name: "Lato-ThinItalic", size: size.rawValue + (adjusted ? variationSize : 0))!
  }
  
  static func latoLightItalic(of size: FontSize, adjusted: Bool = true) -> UIFont {
    return UIFont(name: "Lato-LightItalics", size: size.rawValue + (adjusted ? variationSize : 0))!
  }
  
  static func latoItalic(of size: FontSize, adjusted: Bool = true) -> UIFont {
    return UIFont(name: "Lato-Italic", size: size.rawValue + (adjusted ? variationSize : 0))!
  }
  
  static func latoBold(of size: FontSize, adjusted: Bool = true) -> UIFont {
    return UIFont(name: "Lato-Bold", size: size.rawValue + (adjusted ? variationSize : 0))!
  }
  
  static func latoSemiboldItalic(of size: FontSize, adjusted: Bool = true) -> UIFont {
    return UIFont(name: "Lato-SemiboldItalic", size: size.rawValue + (adjusted ? variationSize : 0))!
  }
  
  static func latoBoldItalic(of size: FontSize, adjusted: Bool = true) -> UIFont {
    return UIFont(name: "Lato-BoldItalic", size: size.rawValue + (adjusted ? variationSize : 0))!
  }
  
  static func latoMediumItalic(of size: FontSize, adjusted: Bool = true) -> UIFont {
    return UIFont(name: "Lato-MediumItalic", size: size.rawValue + (adjusted ? variationSize : 0))!
  }
  
  static func latoBlack(of size: FontSize, adjusted: Bool = true) -> UIFont {
    return UIFont(name: "Lato-Black", size: size.rawValue + (adjusted ? variationSize : 0))!
  }
  
  static func latoHeavyItalic(of size: FontSize, adjusted: Bool = true) -> UIFont {
    return UIFont(name: "Lato-HeavyItalic", size: size.rawValue + (adjusted ? variationSize : 0))!
  }
  
  static func latoLight(of size: FontSize, adjusted: Bool = true) -> UIFont {
    return UIFont(name: "Lato-Light", size: size.rawValue + (adjusted ? variationSize : 0))!
  }
  
  static func latoBlackItalic(of size: FontSize, adjusted: Bool = true) -> UIFont {
    return UIFont(name: "Lato-BlackItalic", size: size.rawValue + (adjusted ? variationSize : 0))!
  }
  
  static func latoHeavy(of size: FontSize, adjusted: Bool = true) -> UIFont {
    return UIFont(name: "Lato-Heavy", size: size.rawValue + (adjusted ? variationSize : 0))!
  }
}
