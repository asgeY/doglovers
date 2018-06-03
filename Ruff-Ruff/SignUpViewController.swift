//
//  SignUpViewController.swift
//  Ruff-Ruff
//
//  Created by Likhon Gomes on 5/31/18.
//  Copyright © 2018 ruffRuff. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func dismissOnClick(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func signUpButton(_ sender: Any) {
        
        let ref:DatabaseReference! = Database.database().reference()
        ref.child("users").childByAutoId().setValue(["username": usernameTextField.text, "email":emailTextField.text])
    }
    
    

}
