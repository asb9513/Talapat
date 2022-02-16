//
//  LoginVCViewController.swift
//  mvp
//
//  Created by Ahmed Saeed on 1/13/22.
//  Copyright © 2022 Ahmed Saeed. All rights reserved.
//

import UIKit
import SKActivityIndicatorView
class RegisterVCViewController: UIViewController,RegisterView {

    
 
 
    @IBOutlet weak var Nametxt: UITextField!
    @IBOutlet weak var Emailtxt: UITextField!
    @IBOutlet weak var Adresstxt: UITextField!
    @IBOutlet weak var Phonetxt: UITextField!
    @IBOutlet weak var Passwordtxt: UITextField!
    @IBOutlet weak var ConfrmPasswordtxt: UITextField!
    
    var presenter : RegisterVCPresenter!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = RegisterVCPresenter(View: self)
       
        
    }
    func showIndecator() {
        SKActivityIndicator.show()
    }
    
    func hideIndicator() {
        SKActivityIndicator.dismiss()
    }
    
    func showError(error: String) {
        print(error)
    }
    
    func DataSavedSuccessfully() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "Home") as!HomeVC
        self.present(vc, animated: true, completion: nil)
        
    }
    
    @IBAction func signup(_ sender: Any) {
        self.validationtxt()
        presenter.registerUser()
    }
    
    


}
