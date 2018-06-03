//
//  SignInViewController.swift
//  Ruff-Ruff
//
//  Created by Likhon Gomes on 5/31/18.
//  Copyright © 2018 ruffRuff. All rights reserved.
//

import UIKit


class SignInViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var emailTextfield: UITextField!
    
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBOutlet weak var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextfield {
            passwordTextfield.becomeFirstResponder()
        } else if textField == passwordTextfield{
            textField.resignFirstResponder()
        }
        return true
    }
    
    @IBAction func signInButtonOnClick(_ sender: Any) {
        
    }
    
}
