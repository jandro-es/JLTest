//
//  ProductGridCollectionViewCell.swift
//  JLTest
//
//  Created by Alejandro Barros Cuetos on 08/03/2017.
//  Copyright © 2017 Filtercode Ltd. All rights reserved.
//

import UIKit
import AlamofireImage

class ProductGridCollectionViewCell: UICollectionViewCell {
  
  static let identifier = "ProductGridCollectionViewCell"
  
  /// Outlets
  @IBOutlet weak var productImage: UIImageView!
  @IBOutlet weak var productLabel: UILabel!
  
  func setCell(with title: String, _ price: String, _ imageUrl: String) {
    let attrString = NSMutableAttributedString(string: "\(title)\n", attributes: [NSFontAttributeName: UIFont.latoRegular(of: UIFont.FontSize.mediumText), NSForegroundColorAttributeName: UIColor.jlBlack])
    attrString.append(NSAttributedString(string: "£\(price)", attributes: [NSFontAttributeName: UIFont.latoBold(of: UIFont.FontSize.mediumText), NSForegroundColorAttributeName: UIColor.jlBlack]))
    productLabel.attributedText = attrString
    productImage.af_setImage(withURL: URL(string: imageUrl)!, placeholderImage: nil, filter: nil, progress: nil, progressQueue: .main, imageTransition: UIImageView.ImageTransition.crossDissolve(0.2), runImageTransitionIfCached: false, completion: nil)
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    layer.borderColor = UIColor.jlGray.cgColor
    layer.borderWidth = 1.0
  }
}
