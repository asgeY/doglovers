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
        let storage = Storage.storage()
        let storageRef = storage.reference()
        let downloadFile = storageRef.child("images.jpeg")
        // Download in memory with a maximum allowed size of 1MB (1 * 1024 * 1024 bytes)
        
    }
}
