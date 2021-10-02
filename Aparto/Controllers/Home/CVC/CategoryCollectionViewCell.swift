//
//  CategoryCollectionViewCell.swift
//  ApartoApp
//
//  Created by Asliddin Mahmudov on 9/9/21.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    static let identifire: String = "CategoryCollectionViewCell"
   
    static func nib() -> UINib {
        return UINib(nibName: "CategoryCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setShadow()
    }
    
    func updateCell(name: String, desc: String, image: String) {
        nameLabel.text = name
        descLabel.text = desc
        imageView.image = UIImage(named: image)
    }
    
    func setShadow() {
        containerView.layer.cornerRadius = 12
        contentView.backgroundColor = .clear
        contentView.layer.shadowColor = #colorLiteral(red: 0.9152246118, green: 0.9152504802, blue: 0.9110830426, alpha: 1)
        contentView.layer.shadowOffset = CGSize(width: 0, height: 0)
        contentView.layer.shadowRadius = 4
        contentView.layer.shadowOpacity = 1
    }

}
