//
//  AlllInformationTableViewCell.swift
//  Aparto
//
//  Created by Asliddin Mahmudov on 9/12/21.
//

import UIKit

class AlllInformationTableViewCell: UITableViewCell {

    static let identifire: String = "AlllInformationTableViewCell"
   
    static func nib() -> UINib {
        return UINib(nibName: "AlllInformationTableViewCell", bundle: nil)
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateCell(title: String, desc: String) {
        titleLabel.text = title
        descriptionLabel.text = desc
    }
    
}
