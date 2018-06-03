//
//  SignInViewController.swift
//  Ruff-Ruff
//
//  Created by Likhon Gomes on 5/31/18.
//  Copyright © 2018 ruffRuff. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignInViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var emailTextfield: UITextField!
    
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBOutlet weak var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func SignInButton_TouchUpInside(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailTextfield.text!, password: passwordTextfield.text!, completion: {(user,error) in
            if error != nil {
                print(error!.localizedDescription)
            }
            self.performSegue(withIdentifier: "onToTheHome", sender: nil)
        })
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
    
    
    
}
