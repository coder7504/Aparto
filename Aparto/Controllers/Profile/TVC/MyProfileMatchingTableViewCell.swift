//
//  MyProfileMatchingTableViewCell.swift
//  Aparto
//
//  Created by Mac user on 13/09/21.
//

import UIKit

class MyProfileMatchingTableViewCell: UITableViewCell {
    
    static let identifire: String = "MyProfileMatchingTableViewCell"
   
    static func nib() -> UINib {
        return UINib(nibName: "MyProfileMatchingTableViewCell", bundle: nil)
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateCell(title: String) {
        titleLabel.text = title
    }
    
}
