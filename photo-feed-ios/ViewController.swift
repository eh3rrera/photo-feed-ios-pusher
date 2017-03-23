//
//  ViewController.swift
//  photo-feed-ios
//
//  Created by Esteban Herrera on 3/21/17.
//  Copyright © 2017 Esteban Herrera. All rights reserved.
//

import UIKit
import PusherSwift

class ViewController: UITableViewController {
    
    let cellId = "cellId"
    var photos = [Photo]()
    var pusher: Pusher! = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Pusher Photo Feed"
        tableView.register(PhotoCell.self, forCellReuseIdentifier: cellId)
        
        pusher = Pusher(
            key: "<INSERT_YOUR_PUSHER_KEY_HERE>"
        )
        
        let channel = pusher.subscribe("photos")
        
        let _ = channel.bind(eventName: "new_photo", callback: { (data: Any?) -> Void in
            if let data = data as? [String : AnyObject] {
                let url = data["url"] as! String
                
                let photo = Photo(url: url)
                
                self.photos.insert(photo, at: self.photos.startIndex)
                
                let indexPath = IndexPath(row: 0, section: 0)
                self.tableView.insertRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
                self.tableView.scrollToRow(at: indexPath, at: UITableViewScrollPosition.none, animated: true)
            }
        })
        
        pusher.connect()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! PhotoCell
        
        cell.photo = photos[indexPath.item]
        
        return cell;
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 480
    }
    

}

