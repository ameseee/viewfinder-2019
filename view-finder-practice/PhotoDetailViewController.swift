//
//  PhotoDetailViewController.swift
//  view-finder-practice
//
//  Created by Amy Holt on 5/5/19.
//  Copyright © 2019 Amy Holt. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    
    @IBOutlet weak var detailPhoto: UIImageView!
    var photo : Photos? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let realPhoto = photo {
            title = realPhoto.caption
            
            if let cellPhotoImageData = realPhoto.imageData {
                if let cellPhotoImage = UIImage(data: cellPhotoImageData) {
                    detailPhoto.image = cellPhotoImage
                }
            }
        }
    }

}
