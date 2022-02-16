//
//  presenter.swift
//  mvp
//
//  Created by Ahmed Saeed on 1/12/22.
//  Copyright © 2022 Ahmed Saeed. All rights reserved.
//

import UIKit
import Alamofire
protocol RegisterView:class {
    func showIndecator()
    func hideIndicator()
    func showError(error:String)
    func DataSavedSuccessfully()
   
}


class RegisterVCPresenter {
    private weak var view : RegisterView?
    private var RegisterVC : RegisterVCViewController?
    
    init(View: RegisterVCViewController){
       self.RegisterVC = View
        self.view = View
    }
   
    func registerUser() {
       
       let view2 = RegisterVC
        let parm = ["name":view2!.Nametxt.text!,
                    "phone":view2!.Phonetxt.text!,
                    "email":view2!.Emailtxt.text!,
                    "password":view2!.Passwordtxt.text!,
                    "confirm_password":view2!.ConfrmPasswordtxt.text!,
                    "address":view2!.Adresstxt.text!
            
            ] as [String : Any]
        view?.showIndecator()
        NetWorkManager.instance.API(method: .post, url: Register,parameters:parm) { (err, status, response: RegisterModel?)  in
            self.view?.hideIndicator()
            if response?.status == true{
                print("------------------------------------------------------")
                print(response!)
            self.view?.DataSavedSuccessfully()
                UserDefaults.standard.set(response?.data?.id, forKey: "IDUSER")
                UserDefaults.standard.set(response?.data?.name, forKey: "NAMEUSER")
                UserDefaults.standard.set(response?.data?.phone, forKey: "NAMEPHONE")
                UserDefaults.standard.set(response?.data?.email, forKey: "NAMEEMAIL")
                UserDefaults.standard.set(response?.data?.address, forKey: "NAMEADRESS")
                UserDefaults.standard.synchronize()
            }
        else
            {
                self.RegisterVC?.showToast(message: (response?.error)!)
               // self.view?.showError(error: err!.localizedDescription)
            }
        
    
    }
       
       
        
}

    
    
    
}

