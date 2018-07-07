//
//  dog.swift
//  Ruff-Ruff
//
//  Created by Likhon Gomes on 6/15/18.
//  Copyright © 2018 ruffRuff. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class dog{
    
    let ref:DatabaseReference = Database.database().reference()
    
    var dogName:String
    var dogAge:Int
    var dogBreed:String
    var dogVaccination:Array<String>
    var dogImage: Array<UIImage>
    var tipsTricks: Array<String> /// the logo should be similar to a bone.
    
    init(dogName:String,dogAge:Int,dogBreed:String,dogVaccination:Array<String>?,dogImage:Array<UIImage>?,tipsTricks:Array<String>?) {
        self.dogName = dogName
        self.dogAge = dogAge
        self.dogBreed = dogBreed
        self.dogVaccination = dogVaccination!
        self.dogImage = dogImage!
        self.tipsTricks = tipsTricks!
    }
    
    init() {
        self.dogName = ""
        self.dogAge = 0
        self.dogBreed = ""
        self.dogVaccination = []
        self.dogImage = []
        self.tipsTricks = []
    }
    
    func getDogName() -> String {
        return self.dogName
    }
    
    func getDogAge() -> Int {
        return dogAge
    }
    
    func setDogName(dogName:String) -> Void {
        self.dogName = dogName
        self.ref.child("users/\(Auth.auth().currentUser!.uid)/dogs/\(dogName)/name").setValue(dogName)
    }
    
    func setDogAge(dogAge:Int) -> Void {
        self.dogAge = dogAge
        self.ref.child("users/\(Auth.auth().currentUser!.uid)/dogs/\(dogName)/age").setValue(dogAge)
    }
    
    func setDogBreed(dogBreed:String) -> Void {
        self.dogBreed = dogBreed
        self.ref.child("users/\(Auth.auth().currentUser!.uid)/dogs/\(dogName)/breed").setValue(dogName)
    }
    
    func setDogImage(dogImage:UIImage) -> Void {
        
    }
    
}
