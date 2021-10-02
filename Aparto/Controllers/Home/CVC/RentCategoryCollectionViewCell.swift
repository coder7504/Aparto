//
//  rentCategoryCollectionViewCell.swift
//  Aparto
//
//  Created by Asliddin Mahmudov on 9/9/21.
//

import UIKit

class RentCategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    static let identifire: String = "RentCategoryCollectionViewCell"
   
    static func nib() -> UINib {
        return UINib(nibName: "RentCategoryCollectionViewCell", bundle: nil)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
