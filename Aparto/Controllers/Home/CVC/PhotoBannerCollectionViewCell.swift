//
//  PhotoBannerCollectionViewCell.swift
//  ApartoApp
//
//  Created by Asliddin Mahmudov on 9/9/21.
//

import UIKit

class PhotoBannerCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageVIewOutlet: UIImageView!
    
    static let identifire: String = "PhotoBannerCollectionViewCell"
   
    static func nib() -> UINib {
        return UINib(nibName: "PhotoBannerCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageVIewOutlet.layer.cornerRadius = 8
    }

}
