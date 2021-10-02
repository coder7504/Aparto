//
//  MyAnnouncementsBigPhotoCollectionViewCell.swift
//  Aparto
//
//  Created by Mac user on 13/09/21.
//

import UIKit

class MyAnnouncementsBigPhotoCollectionViewCell: UICollectionViewCell {

    static let identifire: String = "MyAnnouncementsBigPhotoCollectionViewCell"
   
    static func nib() -> UINib {
        return UINib(nibName: "MyAnnouncementsBigPhotoCollectionViewCell", bundle: nil)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
