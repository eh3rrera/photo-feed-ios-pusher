//
//  PhotoCell.swift
//  photo-feed-ios
//
//  Created by Esteban Herrera on 3/21/17.
//  Copyright © 2017 Esteban Herrera. All rights reserved.
//

import UIKit
import Kingfisher

class PhotoCell : UITableViewCell {
    var photo: Any? {
        didSet {
            guard let p = photo as? Photo else { return }
            
            // Create the image URL and set it with Kingfisher
            let imageUrl = URL(string: p.url)
            photoImage.kf.indicatorType = .activity
            photoImage.kf.setImage(
                with: imageUrl,
                placeholder: #imageLiteral(resourceName: "placeholder"),
                options: [.transition(.fade(0.5))]
            )
        }
    }
    
    let photoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = UIViewContentMode.scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(photoImage)
        
        photoImage.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        photoImage.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        photoImage.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        photoImage.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        
        selectionStyle = .none
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
