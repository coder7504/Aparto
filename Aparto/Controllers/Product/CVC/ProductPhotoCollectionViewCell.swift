//
//  ProductPhotoCollectionViewCell.swift
//  Aparto
//
//  Created by Asliddin Mahmudov on 9/11/21.
//

import UIKit

class ProductPhotoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    static let identifire: String = "ProductPhotoCollectionViewCell"
   
    static func nib() -> UINib {
        return UINib(nibName: "ProductPhotoCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
