//
//  Firebase.swift
//  Ruff-Ruff
//
//  Created by Likhon Gomes on 6/16/18.
//  Copyright © 2018 ruffRuff. All rights reserved.
//

import Foundation
import Firebase
import FirebaseStorageUI

class FirebaseImporter {
    
    init() {
        getDataFromFirebase()
    }
    
    func getDataFromFirebase() -> Void {
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
                        let data = userData()
                        print("FireBaseImporter Called")
                        //data.setUserImage(uImage: img)
                        data.setUserImage(image: img) 
                        
                    }
                }
            }
        })
    }
}
