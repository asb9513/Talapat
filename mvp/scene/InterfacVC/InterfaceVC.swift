//
//  ViewController.swift
//  mvp
//
//  Created by Ahmed Saeed on 1/12/22.
//  Copyright © 2022 Ahmed Saeed. All rights reserved.
//

import UIKit

class InterfacVC: UIViewController {

    @IBOutlet weak var btnSignUp: UIButton!
    @IBOutlet weak var BTNcontainerView: UIView!
    @IBOutlet weak var btnSignIn: UIButton!
    @IBOutlet weak var img: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        btnSignIn.layer.cornerRadius = 15
        btnSignIn.layer.masksToBounds = true
        btnSignUp.layer.cornerRadius = 15
        btnSignUp.layer.masksToBounds = true
        BTNcontainerView.layer.cornerRadius = 20
        BTNcontainerView.layer.masksToBounds = true
        img.layer.cornerRadius = 10
        img.layer.masksToBounds = true
        
    }


}

