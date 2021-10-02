//
//  BuildingPermitTableViewCell.swift
//  Aparto
//
//  Created by Mac user on 16/09/21.
//

import UIKit

protocol DeleteRow {
    func deleteRow(index: IndexPath)
}

class BuildingPermitTableViewCell: UITableViewCell {

    @IBOutlet weak var bacroundView: UIView!
    
    static let identifire: String = "BuildingPermitTableViewCell"
   
    static func nib() -> UINib {
        return UINib(nibName: "BuildingPermitTableViewCell", bundle: nil)
    }
    
    var delegate: DeleteRow!
    var index: IndexPath!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    @IBAction func deleteBtnTapped(_ sender: Any) {
        delegate.deleteRow(index: index)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
