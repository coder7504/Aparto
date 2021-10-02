//
//  SearchPaymentTableViewCell.swift
//  Aparto
//
//  Created by Asliddin Mahmudov on 9/21/21.
//

import UIKit

class SearchPaymentTableViewCell: UITableViewCell {

    static let identifier = "SearchPaymentTableViewCell"
    
    static func nib()-> UINib {
        UINib(nibName: "SearchPaymentTableViewCell", bundle: nil)
    }
    
    @IBOutlet weak var matchingButtonOutlet: UIButton!
    @IBOutlet weak var cardButtonOutlet: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        selectionStyle = .none
        // Configure the view for the selected state
    }
    
    func setShadowForButton() {
        matchingButtonOutlet.layer.cornerRadius = matchingButtonOutlet.frame.height/2
        cardButtonOutlet.layer.cornerRadius = cardButtonOutlet.frame.height/2
        matchingButtonOutlet.layer.shadowColor = #colorLiteral(red: 0.9152246118, green: 0.9152504802, blue: 0.9110830426, alpha: 1)
        matchingButtonOutlet.layer.shadowRadius = 20
        matchingButtonOutlet.layer.shadowOffset = CGSize(width: 0, height: 4)
        matchingButtonOutlet.layer.shadowOpacity = 1
    }
    
}
