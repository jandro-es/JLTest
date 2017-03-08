//
//  ProductGridViewController.swift
//  JLTest
//
//  Created by Alejandro Barros Cuetos on 07/03/2017.
//  Copyright © 2017 Filtercode Ltd. All rights reserved.
//

import UIKit

final class ProductGridViewController: UIViewController {
  
  static let identifier = "ProductGridViewController"
  
  var modelViewController: ProductGridModelViewController!
  
  fileprivate var products = [ProductGrid]()
  
  /// Outlets
  
  @IBOutlet weak var productGridCollectionView: UICollectionView!
  @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
    loadProducts()
  }
  
  fileprivate func setupView() {
    productGridCollectionView.delegate = self
    productGridCollectionView.dataSource = self
    productGridCollectionView.alpha = 0.0
    title = "Dishwashers"
  }
  
  fileprivate func loadProducts() {
    loadingIndicator.startAnimating()
    modelViewController.fetchAll(completionHandler: { (error, productsCollection) in
      if let error = error {
        debugPrint("Error while fetching product grid: \(error)")
        // TODO: Display user facing error
      } else {
        guard let productsCollection = productsCollection else {
          debugPrint("No valid products")
          return
        }
        self.products = productsCollection.products
        self.title = "Dishwashers (\(productsCollection.gridInfo.results))"
        self.loadingIndicator.stopAnimating()
        self.productGridCollectionView.reloadData()
        UIView.animate(withDuration: 0.3, animations: { 
          self.productGridCollectionView.alpha = 1.0
        })
      }
    })
  }
}

extension ProductGridViewController: UICollectionViewDelegate {
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let _ = products[indexPath.row].id
    // TODO: Push to product detail page
  }
}

extension ProductGridViewController: UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return products.count
  }
  
  public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let product = products[indexPath.row]
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductGridCollectionViewCell.identifier, for: indexPath) as! ProductGridCollectionViewCell
    cell.setCell(with: product.title, product.price, product.image)
    return cell
  }
}
