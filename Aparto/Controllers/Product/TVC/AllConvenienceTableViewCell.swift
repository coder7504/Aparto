//
//  AllConvenienceTableViewCell.swift
//  Aparto
//
//  Created by Asliddin Mahmudov on 9/12/21.
//

import UIKit

class AllConvenienceTableViewCell: UITableViewCell {

    
    static let identifire: String = "AllConvenienceTableViewCell"
   
    static func nib() -> UINib {
        return UINib(nibName: "AllConvenienceTableViewCell", bundle: nil)
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateCell(title: String) {
        titleLabel.text = title
    }
    
}
