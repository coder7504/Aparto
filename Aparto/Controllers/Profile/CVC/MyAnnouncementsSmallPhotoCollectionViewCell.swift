//
//  MyAnnouncementsSmallPhotoCollectionViewCell.swift
//  Aparto
//
//  Created by Mac user on 13/09/21.
//

import UIKit

class MyAnnouncementsSmallPhotoCollectionViewCell: UICollectionViewCell {

    static let identifire: String = "MyAnnouncementsSmallPhotoCollectionViewCell"
   
    static func nib() -> UINib {
        return UINib(nibName: "MyAnnouncementsSmallPhotoCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
