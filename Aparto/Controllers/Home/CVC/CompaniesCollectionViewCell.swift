//
//  CompaniesCollectionViewCell.swift
//  Aparto
//
//  Created by Asliddin Mahmudov on 9/10/21.
//

import UIKit
import SDWebImage

class CompaniesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var imageViewOutlet: UIImageView!
    
    static let identifire: String = "CompaniesCollectionViewCell"
   
    static func nib() -> UINib {
        return UINib(nibName: "CompaniesCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }

    func setCell(title: String, image: String) {
        titleLabel.text = title
        imageViewOutlet.sd_setImage(with: URL(string: API.imageBaseUrl+image), placeholderImage: #imageLiteral(resourceName: "user"))
        containerView.layer.cornerRadius = 16
        containerView.layer.borderWidth = 1
        containerView.layer.borderColor = #colorLiteral(red: 0.9568627451, green: 0.968627451, blue: 0.968627451, alpha: 1)
    }
    
}
