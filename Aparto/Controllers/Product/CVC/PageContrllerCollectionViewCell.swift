//
//  PageContrllerCollectionViewCell.swift
//  Aparto
//
//  Created by Asliddin Mahmudov on 9/11/21.
//

import UIKit

class PageContrllerCollectionViewCell: UICollectionViewCell {

    
    static let identifire: String = "PageContrllerCollectionViewCell"
   
    static func nib() -> UINib {
        return UINib(nibName: "PageContrllerCollectionViewCell", bundle: nil)
    }
    @IBOutlet weak var colorView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
