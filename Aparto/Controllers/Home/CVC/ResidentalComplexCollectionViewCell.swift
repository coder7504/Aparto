//
//  ResidentalComplexCollectionViewCell.swift
//  ApartoApp
//
//  Created by Asliddin Mahmudov on 9/9/21.
//

import UIKit

class ResidentalComplexCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var heartView: UIView!
    @IBOutlet weak var heightForResidentalComplexCell: NSLayoutConstraint!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    static let identifire: String = "ResidentalComplexCollectionViewCell"
   
    static func nib() -> UINib {
        return UINib(nibName: "ResidentalComplexCollectionViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.layer.cornerRadius = 6
    }
    
    func updateCell(isHide: Bool, top: CGFloat, title: String, desc: String, price: Double) {
        titleLabel.text = title
        descLabel.text = desc
        priceLabel.text = "\(price)"
        heightForResidentalComplexCell.constant = top
        heartView.isHidden = isHide
    }

    @IBAction func heartButtonTapped(_ sender: Any) {
        Alert.showAlert(forState: .addFavorite, message: "Объявление добавлено в избранные")
    }
}
