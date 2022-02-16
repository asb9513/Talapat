//
//  HomePresenter.swift
//  mvp
//
//  Created by Ahmed Saeed on 1/16/22.
//  Copyright © 2022 Ahmed Saeed. All rights reserved.
//

import Foundation
import Alamofire
import Kingfisher
protocol ProductsView:class {
    func showIndecator()
    func hideIndicator()
    func feachinfData()
    func showError(error:String)
    
}
protocol ProductsCell {
    func configureName(name:String)
    func configurePrice(Price:String)
    
    
    func configurationImages(image:String)
}







class UsersVCPresenter {
     private weak var view :ProductsView?
    private var Products : ShowProducts?
  //  private var extra :[Extra] = []
    private var productVc : HomeVC?
    private var imgview : UIImageView?
    
    
    init(view:HomeVC){
        self.view = view
        self.productVc = view
    }
  
    
    
    func getProduct (categoryId:Int?){
        self.view?.showIndecator()
        NetWorkManager.instance.API(method:.post, url: category,parameters:["categoryId":categoryId ?? 0]) { (err, status, response:ShowProducts?)  in
                self.view?.hideIndicator()
                if let error = err {
                self.view?.showError(error: error as! String)
                
            }
                else{
                    guard let product = response else {return}
                    self.Products = product
                  //  self.dataex = (response?.data.map{_ in (0.size)}
                    self.view?.feachinfData()
                }
            }
            
        }
    func ProductsNumber(index:Int)-> Int{
        guard let products = Products else {return 0}
        return products.data.products.count
    }
    
        func configuer (cell:ProductsCell, index: Int){
        let productex = Products
            cell.configureName(name:productex!.data.products[index].name )
            cell.configurePrice(Price: productex!.data.products[index].extra[index].price)
            
            cell.configurationImages(image:(productex?.data.products[index].image)!)
          
            }
           
    
    }

extension UIImageView{
    /// this function loads the image from url using kingfiher pod
    /// - Parameter url: the image url to convret to image
    func loadImage(_ url : URL?) {
        self.kf.setImage(
            with: url,
            options: [
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
        self.kf.indicatorType = .activity
    }
}
