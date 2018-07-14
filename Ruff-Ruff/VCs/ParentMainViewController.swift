//
//  ParentMainViewController.swift
//  Ruff-Ruff
//
//  Created by Likhon Gomes on 7/6/18.
//  Copyright © 2018 ruffRuff. All rights reserved.
//

import UIKit
import Firebase
import KeychainSwift


class ParentMainViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{
    
    let storageRef = Storage.storage().reference()
    //var image:UIImage?

    @IBOutlet weak var test: UIImageView!
    
    let dummy = ["asdf","dgh", "wert"]
    
    @IBOutlet weak var collectionView: UICollectionView!
    var dogs:Array<dog> = []
    let dogImage:Array<UIImage> = []
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        Database.database().reference().child("users").child((Auth.auth().currentUser?.uid)!).child("dogs").observe(.childAdded) { (snapshot) in
            //print(snapshot)
            let dogData = dog()
            let value = snapshot.value as? NSDictionary
            dogData.dogName = value?["name"] as? String ?? ""
            dogData.dogBreed = value?["breed"] as? String ?? ""
            dogData.dogAge = value?["age"] as? String ?? ""
            
            //print(self.user.use)
            //self.users.append(user)
            print("printing name:" + dogData.dogName)
            print("sgdf")
            
            self.dogs.append(dogData)
            self.collectionView!.reloadData()
        }
        collectionView.delegate = self
        collectionView.dataSource = self
        //print(dogs[0].dogName)
        //print(dogs[1].dogName)
        //dogs.count
    }

    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(dogs.count)
        return self.dogs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        var data = self.dogs[indexPath.row]
        //print(data.dogName)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        let imageView = cell.viewWithTag(1) as! UIImageView
        let nameLabel = cell.viewWithTag(2) as! UILabel
        let locationLabel = cell.viewWithTag(3) as! UILabel
        let ageLabel = cell.viewWithTag(4) as! UILabel
        let distanceLabel = cell.viewWithTag(5) as! UILabel
        let priceLabel = cell.viewWithTag(6) as! UILabel
        
        nameLabel.text = data.dogName
        ageLabel.text = data.dogAge
        

        
        var image:UIImage?
        
        // Create a reference to the file you want to download
        let islandRef = storageRef.child("/rivers.jpg")
        
        // Download in memory with a maximum allowed size of 1MB (1 * 1024 * 1024 bytes)
        islandRef.getData(maxSize: 10 * 1024 * 1024) { data, error in
            if let error = error {
                print("failed to get image")
                image = UIImage(named: "imagePlaceholder")!
                // Uh-oh, an error occurred!
            } else {
                print("succeeded")
                // Data for "images/island.jpg" is returned
                image = UIImage(data: data!)!
            }
            imageView.image = image
        }
        
        
        
        
        //imageView.sd_setImage(with: reference, placeholderImage: placeholderImage)
        
        cell.reloadInputViews()
        return cell
    }

    
    
    
    @IBAction func logoutClicked(_ sender: Any) {
        let firebaseAuth = Auth.auth()
        do{
            try firebaseAuth.signOut()
        } catch let signOutError as NSError{
            print("Sign Out error: %@", signOutError )
        }
        DataSerivce().keyChain.delete("uid")
        dismiss(animated: true, completion: nil)
        //performSegue(withIdentifier: "backToSignIn", sender: (Any).self)
    }

}
