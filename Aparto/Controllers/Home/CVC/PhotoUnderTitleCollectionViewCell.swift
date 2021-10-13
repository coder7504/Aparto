//
//  PhotoUnderTitleCollectionViewCell.swift
//  Aparto
//
//  Created by Mac user on 09/10/21.
//

import UIKit
import SDWebImage

class PhotoUnderTitleCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    
    static let identifire: String = "PhotoUnderTitleCollectionViewCell"
   
    static func nib() -> UINib {
        return UINib(nibName: "PhotoUnderTitleCollectionViewCell", bundle: nil)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    func updateCell(image: String, title: String, desc: String) {
        imageView.sd_setImage(with: URL(string: API.imageBaseUrl + image), placeholderImage: #imageLiteral(resourceName: "selectNews"))
        titleLabel.text = title
        descLabel.text = desc
        containerView.clipsToBounds = true
        containerView.layer.cornerRadius = 10
    }
    
}
