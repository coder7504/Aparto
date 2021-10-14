//
//  ResidentalComplexCollectionViewCell.swift
//  ApartoApp
//
//  Created by Asliddin Mahmudov on 9/9/21.
//

import UIKit
import SDWebImage

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
    
    var _id: String = ""

    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.layer.cornerRadius = 6
    }
    
    func updateCell(isHide: Bool, top: CGFloat, title: String, desc: String, price: Double, image: String, _id: String) {
        titleLabel.text = title
        descLabel.text = desc
        priceLabel.text = "\(price)"
        heightForResidentalComplexCell.constant = top
        heartView.isHidden = isHide
        imageView.sd_setImage(with: URL(string: API.imageBaseUrl+image), placeholderImage: #imageLiteral(resourceName: "home-2"))
        self._id = _id
    }

    @IBAction func heartButtonTapped(_ sender: Any) {
        
        API.postLikeOne(_id: _id) { isliked in
            if let isliked = isliked {
                if isliked {
                    print("Объявление добавлено в избранные")
                    Alert.showAlert(forState: .addFavorite, message: "Объявление добавлено в избранные")
                } else {
                    Alert.showAlert(forState: .error, message: "Объявление недобавлено в избранные")
                }
            } else {
                AlertNET.showAlert(title: Keys.a_internet, message: Keys.a_goOnline) { _ in }
            }
        }
        
    }
}

