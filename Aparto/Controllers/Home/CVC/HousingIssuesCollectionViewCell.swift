//
//  housingIssuesCollectionViewCell.swift
//  Aparto
//
//  Created by Asliddin Mahmudov on 9/10/21.
//

import UIKit
import SDWebImage

class HousingIssuesCollectionViewCell: UICollectionViewCell {

    @IBOutlet var containerView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    
    static let identifire: String = "HousingIssuesCollectionViewCell"
   
    static func nib() -> UINib {
        return UINib(nibName: "HousingIssuesCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    func updateCell(image: String, title: String, desc: String) {
        containerView.layer.cornerRadius = 8
        titleLabel.text = title
        descLabel.text = desc
        imageView.sd_setImage(with: URL(string: API.imageBaseUrl+image), placeholderImage: #imageLiteral(resourceName: "humanitarian_aid"))
    }

}
