//
//  File.swift
//  Ruff-Ruff
//
//  Created by Likhon Gomes on 6/15/18.
//  Copyright © 2018 ruffRuff. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseStorageUI

class userData{
    
    var userName:String
    var emailAddress:String
    var password:String
    var description:String
    var userAge:Int = 0
    var userImage:UIImage
    var dogData:Array<dog>
    
    init() {
        
        
        
        self.userName = ""
        self.emailAddress = ""
        self.password = ""
        self.description = ""
        self.userAge = 0
        self.userImage = UIImage()
        self.dogData = []
        //fire.getDataFromFirebase()
        
    }
        

    func setUserName(){
        
    }
    
    func setEmailAddress(){
        
    }
    
    func setDescription(description:String) -> Void {
        var ref:DatabaseReference
        ref = Database.database().reference()
        ref.child("users").childByAutoId().setValue(description)

    }
    
    func setUserAge(uAge:Int) -> Void {
        userAge = uAge
    }
    
    func setUserImage(image:UIImage) -> Void  {
        
        //self.userImage = image
    }
    
    

    
    func getUserName() -> String{
        return self.userName
    }
    
    func getEmailAddress() -> String{
        return self.emailAddress
    }
    
    func getDescription() -> String {
        return self.description
    }
    
    func getUserAge() -> Int {
        return self.userAge
    }
    
    func getUserImage() -> UIImage {
        
        return self.userImage
    }
 
}
