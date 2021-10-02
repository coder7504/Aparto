//
//  MyProfileNotificationsTableViewCell.swift
//  Aparto
//
//  Created by Mac user on 13/09/21.
//

import UIKit

class MyProfileNotificationsTableViewCell: UITableViewCell {

    
    static let identifire: String = "MyProfileNotificationsTableViewCell"
   
    static func nib() -> UINib {
        return UINib(nibName: "MyProfileNotificationsTableViewCell", bundle: nil)
    }
    
    @IBOutlet weak var yellowRoundImage: UIImageView!
    @IBOutlet weak var containerView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
