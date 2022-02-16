//
//  ProductCell.swift
//  mvp
//
//  Created by Ahmed Saeed on 1/16/22.
//  Copyright © 2022 Ahmed Saeed. All rights reserved.
//

import UIKit
import Kingfisher
class ProductCVCell: UICollectionViewCell,ProductsCell{
    func configurationImages(image: String) {
        ProductImage.loadImage(URL(string: image))
    }
   
    
    
    @IBOutlet weak var ProductImage: UIImageView!
    @IBOutlet weak var ProductName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    func configureName(name: String) {
        ProductName.text = name
    }
  
    

    func configurePrice(Price: String) {
        productPrice.text = Price
    }
  
}
  

