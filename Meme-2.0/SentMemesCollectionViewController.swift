//
//  SentMemesCollectionViewController.swift
//  MemeMe 1.0
//
//  Created by Darin Williams on 2/22/19.
//  Copyright © 2019 dwilliams. All rights reserved.
//

import UIKit


class SentMemesCollectionViewController: UICollectionViewController {

    //MARK set up for shared data model
    var memes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    
    
    //MARK - Control Size of meme space usng flowlayout
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        collectionView!.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let space:CGFloat = 2.0
        let widthDimension = (view.frame.size.width - (2 * space)) / 3.0
        let heightDimension = (view.frame.size.height - (2 * space)) / 3.0
        
        
        flowLayout.minimumLineSpacing = space
        flowLayout.minimumInteritemSpacing = space
        flowLayout.itemSize = CGSize(width: widthDimension, height: heightDimension)
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        NSLog("SentMemesCollectionViewCell: numberOfItemsInSection \(memes.count)")
        return self.memes.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // Configure the cell
        let sentMemeCell = collectionView.dequeueReusableCell(withReuseIdentifier: "SentMemeCustomViewCell", for: indexPath) as! SentMemeCollectionViewCell
    
        let customMemeCell = self.memes[(indexPath as NSIndexPath).row]
        
        sentMemeCell.memeImage?.image =  customMemeCell.memedImage
        
    
        return sentMemeCell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //MARK - Grab Detail view from Story board
        let detailController = self.storyboard!.instantiateViewController(withIdentifier: "SentMemesDetailView") as! SentMemesDetailViewController
        
        //Populate view controller with data from selected item
         detailController.memesData =  self.memes[(indexPath as NSIndexPath).row]
    
        
        //present the controller
        navigationController!.pushViewController(detailController, animated: true)
    }
    


}
