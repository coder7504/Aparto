//
//  HistoryOfBalanceTableViewCell.swift
//  Aparto
//
//  Created by Mac user on 13/09/21.
//

import UIKit

class HistoryOfBalanceTableViewCell: UITableViewCell {

    static let identifire: String = "HistoryOfBalanceTableViewCell"
   
    static func nib() -> UINib {
        return UINib(nibName: "HistoryOfBalanceTableViewCell", bundle: nil)
    }
    
    @IBOutlet weak var moneyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
