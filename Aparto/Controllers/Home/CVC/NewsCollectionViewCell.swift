//
//  NewsCollectionViewCell.swift
//  Aparto
//
//  Created by Asliddin Mahmudov on 9/10/21.
//

import UIKit

class NewsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    
    static let identifire: String = "NewsCollectionViewCell"
   
    static func nib() -> UINib {
        return UINib(nibName: "NewsCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    
    func updateCell(title: String, category: String) {
        containerView.layer.cornerRadius = 12
        categoryLabel.text = category
        titleLabel.text = title
    }

}
