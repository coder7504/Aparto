//
//  AllConvenienceTableViewCell.swift
//  Aparto
//
//  Created by Asliddin Mahmudov on 9/12/21.
//

import UIKit
import SDWebImage

class AllConvenienceTableViewCell: UITableViewCell {

    
    static let identifire: String = "AllConvenienceTableViewCell"
   
    static func nib() -> UINib {
        return UINib(nibName: "AllConvenienceTableViewCell", bundle: nil)
    }
    
    @IBOutlet weak var imagView: UIImageView!
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
    
    func updateCell(title: String, image: String) {
        titleLabel.text = title
        imageView?.sd_setImage(with: URL(string: API.imageBaseUrl+image), placeholderImage: #imageLiteral(resourceName: "collaps"))
    }
    
}
