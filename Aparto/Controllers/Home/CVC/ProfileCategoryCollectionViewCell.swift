//
//  ProfileCategoryCollectionViewCell.swift
//  Aparto
//
//  Created by Asliddin Mahmudov on 9/11/21.
//

import UIKit

class ProfileCategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var containerView: UIView!
    
    
    static let identifire: String = "ProfileCategoryCollectionViewCell"
   
    static func nib() -> UINib {
        return UINib(nibName: "ProfileCategoryCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func updateCell(title: String) {
        containerView.layer.cornerRadius = 8
        containerView.clipsToBounds = true
        titleLabel.text = title
    }

}
