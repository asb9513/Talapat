//
//  LoginPresenter.swift
//  mvp
//
//  Created by Ahmed Saeed on 1/15/22.
//  Copyright © 2022 Ahmed Saeed. All rights reserved.
//

import Foundation
import Alamofire

protocol LoginView :class {
   func showIndicator()
    func hideIndicator()
    func loginDone()
    
}
class LoginPresenter {
    private weak var view :LoginView?
    private var loginvc : LoginVC?
    init(view:LoginVC){
        self.view = view
        self.loginvc = view
    }
    func LoginAction(){
      
        let params = [
            "email": loginvc!.Email.text!,
            "password": loginvc!.password.text!
        ] as [String:Any]
        view?.showIndicator()
        NetWorkManager.instance.API( method: .post, url: login, parameters:params) { (err, status, response:LoginModel?) in
            self.view?.hideIndicator()
            if response?.status == true {
                self.view?.loginDone()
                UserDefaults.standard.set(response?.data?.id, forKey: "IDUSER")
                UserDefaults.standard.set(response?.data?.name, forKey: "NAMEUSER")
                UserDefaults.standard.set(response?.data?.phone, forKey: "NAMEPHONE")
                UserDefaults.standard.set(response?.data?.email, forKey: "NAMEEMAIL")
                UserDefaults.standard.set(response?.data?.address, forKey: "NAMEADRESS")
                UserDefaults.standard.synchronize()
            }
            else{
                //self.loginvc?.showToast(message: err as! String)
            }
            
            
        }
        
    }
    
    
    
    
}
