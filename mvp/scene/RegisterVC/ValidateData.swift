//
//  ValidateData.swift
//  mvp
//
//  Created by Ahmed Saeed on 1/13/22.
//  Copyright © 2022 Ahmed Saeed. All rights reserved.
//

import UIKit
extension RegisterVCViewController
{
    func validationtxt(){
        if self.Nametxt.text!.isEmpty  {
            self.showToast(message: "Please fill your Name... ")
        }
     else   if self.Emailtxt.text!.isEmpty{
            self.showToast(message: "Please fill your Email ")
            
        }
     else   if self.Phonetxt.text!.isEmpty {
            self.showToast(message: "Please fill your phone ")
            
        }
    else    if self.Adresstxt.text!.isEmpty {
            self.showToast(message: "Please fill your address ")
            
        }
      else  if self.Passwordtxt.text!.isEmpty  {
            self.showToast(message: "Please Enter your password ")
            
        }
       else if self.ConfrmPasswordtxt.text!.isEmpty  {
            self.showToast(message: "Please confirme your password ")
            if self.ConfrmPasswordtxt != self.Passwordtxt {
                self.showToast(message: "not simmilar to password")
            }
            else {
                self.showToast(message: "Please fill all fields")
            }
        }
        
        
        
    }
   
    
    
    
}
