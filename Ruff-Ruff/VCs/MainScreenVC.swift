//
//  MainScreenVC.swift
//  Ruff-Ruff
//
//  Created by Nikhil on 6/9/18.
//  Copyright © 2018 ruffRuff. All rights reserved.
//

import UIKit
import Firebase
import KeychainSwift

class MainScreenVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func logoutClicked(_ sender: Any) {
        let firebaseAuth = FIRAuth.auth()
        do{
            try firebaseAuth?.signOut()
        } catch let signOutError as NSError{
            print("Sign Out error: %@", signOutError )
        }
        DataSerivce().keyChain.delete("uid")
        dismiss(animated: true, completion: nil)
        
    }
    

}
