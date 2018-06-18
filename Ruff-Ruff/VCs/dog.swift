//
//  dog.swift
//  Ruff-Ruff
//
//  Created by Likhon Gomes on 6/15/18.
//  Copyright © 2018 ruffRuff. All rights reserved.
//

import Foundation
import UIKit

class dog{
    
    var dogName:String
    var dogAge:Int
    var dogVaccination:Array<String>
    var dogImage: Array<UIImage>
    
    
    init(dogName:String,dogAge:Int,dogVaccination:Array<String>,dogImage:Array<UIImage>) {
        self.dogName = dogName
        self.dogAge = dogAge
        self.dogVaccination = dogVaccination
        self.dogImage = dogImage
    }
    
    init() {
        self.dogName = ""
        self.dogAge = 0
        self.dogVaccination = []
        self.dogImage = []
        
    }
    
    func getDogName() -> String {
        return self.dogName
    }
    
}
