//
//  ComplaintTableViewCell.swift
//  Aparto
//
//  Created by Asliddin Mahmudov on 9/27/21.
//

import UIKit

class ComplaintTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var colorView: UIView!
    
    static let identifire: String = "ComplaintTableViewCell"
   
    static func nib() -> UINib {
        return UINib(nibName: "ComplaintTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func updateCell(title: String, bacColor: UIColor) {
        titleLabel.text = title
        colorView.backgroundColor = bacColor
    }
    
    func setBorder() {
            colorView.layer.borderWidth = 2
            colorView.layer.borderColor = #colorLiteral(red: 0.7803921569, green: 0.7803921569, blue: 0.8, alpha: 1)
    }
    
}
