//
//  HomeViewController.swift
//  Ruff-Ruff
//
//  Created by Likhon Gomes on 6/8/18.
//  Copyright © 2018 ruffRuff. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDataSource{
    
        
    @IBOutlet weak var collectionViewCell: UICollectionViewCell!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: IMAGEIO_PNG_FILTER_UP)
        return collectionViewCell
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}
