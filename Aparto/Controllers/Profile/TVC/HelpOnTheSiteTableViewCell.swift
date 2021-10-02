//
//  HelpOnTheSiteTableViewCell.swift
//  Aparto
//
//  Created by Mac user on 14/09/21.
//

import UIKit

class HelpOnTheSiteTableViewCell: UITableViewCell {

    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageViewOutlet: UIImageView!
    
    static let identifire: String = "HelpOnTheSiteTableViewCell"
   
    static func nib() -> UINib {
        return UINib(nibName: "HelpOnTheSiteTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    func setShadow(tit: String, desc: String) {
        shadowView.layer.shadowColor = #colorLiteral(red: 0.948771894, green: 0.9463201165, blue: 0.942756474, alpha: 1)
        shadowView.layer.shadowRadius = 4
        shadowView.layer.shadowOffset = CGSize(width: 0, height: 4)
        shadowView.layer.shadowOpacity = 1
        
        titleLabel.text = tit
        descLabel.text = desc
        
    }
    
}
