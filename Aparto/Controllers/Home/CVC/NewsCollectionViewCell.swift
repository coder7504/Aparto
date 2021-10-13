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
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var rightConstraint: NSLayoutConstraint!
    @IBOutlet weak var leftConstraint: NSLayoutConstraint!
    
    static let identifire: String = "NewsCollectionViewCell"
   
    static func nib() -> UINib {
        return UINib(nibName: "NewsCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    
    func updateCell(title: String, category: String, isTimeYes: Bool) {
        containerView.layer.cornerRadius = 12
        categoryLabel.text = category
        titleLabel.text = title
        timeLabel.isHidden = !isTimeYes
        if isTimeYes {
            rightConstraint.constant = 16
            leftConstraint.constant = 16
        }
    }

}
