//
//  SentMemesTableViewController.swift
//  MemeMe 1.0
//
//  Created by Darin Williams on 2/22/19.
//  Copyright © 2019 dwilliams. All rights reserved.
//

import UIKit


class SentMemesTableViewController: UITableViewController {

    //MARK set up for share data model
    var memes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

      }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return memes.count
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SentMemeTableViewCell", for: indexPath) as! SentMemeTableViewCell

        // Configure the cell...
        let cstmMemeCell = self.memes[(indexPath as NSIndexPath).row]
        
        cell.tblCellImage?.image = cstmMemeCell.memedImage
        
        cell.tblCellText.text = cstmMemeCell.getTextString(topTxt: cstmMemeCell.topText, botTxt: cstmMemeCell.bottomText)

        return cell
    }
 
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        //Mark- Grab Detail veiw from Story board
        
    }

    

}
