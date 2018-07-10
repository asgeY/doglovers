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
    
    @IBOutlet weak var collectionView: UICollectionView!
    let dogData:dog = dog()
    let dogs:Array<dog> = []
    let dogImage:Array<UIImage> = []
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        let imageView = cell.viewWithTag(1) as! UIImageView
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
        
        
        return cell
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
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
