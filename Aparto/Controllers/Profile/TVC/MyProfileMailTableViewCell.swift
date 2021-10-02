//
//  MyProfileMailTableViewCell.swift
//  Aparto
//
//  Created by Mac user on 13/09/21.
//

import UIKit

class MyProfileMailTableViewCell: UITableViewCell {

    
    static let identifire: String = "MyProfileMailTableViewCell"
   
    static func nib() -> UINib {
        return UINib(nibName: "MyProfileMailTableViewCell", bundle: nil)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
