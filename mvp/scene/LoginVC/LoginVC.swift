//
//  HomeVC.swift
//  mvp
//
//  Created by Ahmed Saeed on 1/13/22.
//  Copyright © 2022 Ahmed Saeed. All rights reserved.
//

import UIKit
import SKActivityIndicatorView
class LoginVC: UIViewController {

    
    @IBOutlet weak var Email: UITextField!
    var presenter : LoginPresenter?
    @IBOutlet weak var password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
       presenter = LoginPresenter(view: self)
      
    }
    
  
    @IBAction func loginAction(_ sender: Any) {
        presenter?.LoginAction()
    }
    

}




extension LoginVC: LoginView {
    
    func showIndicator() {
        SKActivityIndicator.show()
    }
    
    func hideIndicator() {
        SKActivityIndicator.dismiss()
    }
    
    func loginDone() {
        /*let vc = storyboard?.instantiateViewController(withIdentifier: "Home") as! HomeVC
        present(vc, animated: true, completion: nil)*/
        let sb = UIStoryboard(name: "Home", bundle: nil)
        let homevc = sb.instantiateViewController(withIdentifier: "Home") as! HomeVC
        self.present(homevc, animated: true, completion: nil)
        
    }
    
}
