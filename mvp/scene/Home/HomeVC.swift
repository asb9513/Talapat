//
//  HomeVC.swift
//  mvp
//
//  Created by Ahmed Saeed on 1/15/22.
//  Copyright © 2022 Ahmed Saeed. All rights reserved.
//

import UIKit
import SKActivityIndicatorView
class HomeVC: UIViewController{

    var presenter : UsersVCPresenter?
    @IBOutlet weak var foodtype: UISegmentedControl!
    @IBOutlet weak var productCollection: UICollectionView!
    var counter : Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        productCollection.delegate = self
        productCollection.dataSource = self
        presenter = UsersVCPresenter(view: self)
        counter = self.foodtype.selectedSegmentIndex+1
        presenter?.getProduct(categoryId: counter!)
        productCollection.reloadData()
    }
    


    @IBAction func menuAction(_ sender: Any) {
    }
    
}
extension HomeVC:UICollectionViewDelegate,UICollectionViewDataSource{
     
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (presenter?.ProductsNumber(index: section))!
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "product", for: indexPath) as! ProductCVCell
        presenter?.configuer(cell: cell, index: indexPath.row)
       // print(cell.ProductImage as Any)
        return cell
    }
    
    
    
    
}
extension HomeVC :ProductsView{
    func showIndecator() {
        SKActivityIndicator.show()
    }
    
    func hideIndicator() {
        SKActivityIndicator.dismiss()
    }
    
    func feachinfData() {
        self.productCollection.reloadData()
    }
    
    func showError(error: String) {
        print(error)
    }
}
