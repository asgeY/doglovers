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
        
    var fire = FirebaseImporter()
    let ref: FIRDatabaseReference = FIRDatabase.database().reference()
    
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
        
        let storage = FIRStorage.storage()
        let storageRef = storage.reference()
        let downloadFile = storageRef.child("images.jpeg")
        // Download in memory with a maximum allowed size of 1MB (1 * 1024 * 1024 bytes)
        downloadFile.data(withMaxSize: 1000000, completion: { (data, error) in
            if error != nil {
                print(" we couldnt download the img")
            } else {
                if let imgData = data {
                    if let img = UIImage(data: imgData) {
                        //let data = userData()
                        print("FireBaseImporter Called")
                        //data.setUserImage(uImage: img)
                        self.userImage = img
                    }
                }
            }
        })
        
        //ref.child("users").childByAutoId().setValue(description)
    }
        

    func setUserName(){
        
    }
    
    func setEmailAddress(){
        
    }
    
    func setDescription(description:String) -> Void {
        var ref:FIRDatabaseReference
        ref = FIRDatabase.database().reference()
        ref.child("users").childByAutoId().setValue(description)

    }
    
    func setUserAge(uAge:Int) -> Void {
        userAge = uAge
    }
    
    func setUserImage(image:UIImage) -> Void  {
        self.userImage = image
    }
    
    

    
    func getUserName() -> String{
        

        let userID = FIRAuth.auth()?.currentUser?.uid
        ref.child("users").child(userID!).observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let value = snapshot.value as? NSDictionary
            let username = value?["username"] as? String ?? ""
            //let user = User(username: username)
            
            // ...
        }) { (error) in
            print(error.localizedDescription)
        }

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
        let storage = FIRStorage.storage()
        let storageRef = storage.reference()
        //storageRef.child(filename)
        
        let downloadFile = storageRef.child("images.jpeg")
        
        // Download in memory with a maximum allowed size of 1MB (1 * 1024 * 1024 bytes)
        downloadFile.data(withMaxSize: 1000000, completion: { (data, error) in
            if error != nil {
                print(" we couldnt download the img")
            } else {
                if let imgData = data {
                    if let img = UIImage(data: imgData) {
                        self.userImage = img
                    }
                }
            }
            
        })
        
        return self.userImage
    }
 
}
