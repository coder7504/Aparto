//
//  AdCollectionViewCell.swift
//  Aparto
//
//  Created by Asliddin Mahmudov on 9/10/21.
//

import UIKit

class AdCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageViewOutlet: UIImageView!
    
    static let identifire: String = "AdCollectionViewCell"
   
    static func nib() -> UINib {
        return UINib(nibName: "AdCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        
    }

}
