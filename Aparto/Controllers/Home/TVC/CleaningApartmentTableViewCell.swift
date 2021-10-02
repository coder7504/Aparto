//
//  CleaningApartmentTableViewCell.swift
//  Aparto
//
//  Created by Asliddin Mahmudov on 9/10/21.
//

import UIKit

class CleaningApartmentTableViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    
    static let identifire: String = "CleaningApartmentTableViewCell"
   
    static func nib() -> UINib {
        return UINib(nibName: "CleaningApartmentTableViewCell", bundle: nil)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateCell() {
        containerView.layer.cornerRadius = 12
        containerView.layer.borderWidth = 1
        containerView.layer.borderColor = #colorLiteral(red: 0.9568627451, green: 0.968627451, blue: 0.968627451, alpha: 1)
    }
    
}
