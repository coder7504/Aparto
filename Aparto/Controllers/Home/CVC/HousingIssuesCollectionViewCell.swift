//
//  housingIssuesCollectionViewCell.swift
//  Aparto
//
//  Created by Asliddin Mahmudov on 9/10/21.
//

import UIKit

class HousingIssuesCollectionViewCell: UICollectionViewCell {

    @IBOutlet var containerView: UIView!
    
    static let identifire: String = "HousingIssuesCollectionViewCell"
   
    static func nib() -> UINib {
        return UINib(nibName: "HousingIssuesCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    func updateCell() {
        containerView.layer.cornerRadius = 8
    }

}
