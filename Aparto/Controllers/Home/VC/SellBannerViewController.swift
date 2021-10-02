//
//  SellBannerViewController.swift
//  ApartoApp
//
//  Created by Asliddin Mahmudov on 9/9/21.
//

import UIKit

class SellBannerViewController: UIViewController {

    @IBOutlet weak var sellButtonOutlet: UIButton!
    @IBOutlet weak var containerViewOulet: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setCornerRadius()
        
    }
    
    fileprivate
    func setCornerRadius() {
        sellButtonOutlet.layer.cornerRadius = 12
        containerViewOulet.layer.cornerRadius = 16
        containerViewOulet.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
    }

}
