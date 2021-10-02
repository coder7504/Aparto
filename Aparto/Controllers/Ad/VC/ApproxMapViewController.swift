//
//  ApproxMapViewController.swift
//  Aparto
//
//  Created by Mac user on 16/09/21.
//

import UIKit

class ApproxMapViewController: UIViewController {

    @IBOutlet weak var bacBtnOutlet: UIButton! {
        didSet {
            bacBtnOutlet.layer.shadowColor = #colorLiteral(red: 0.8419628739, green: 0.8456341624, blue: 0.8406097293, alpha: 1)
            bacBtnOutlet.layer.shadowRadius = 4
            bacBtnOutlet.layer.shadowOffset = CGSize(width: 0, height: 2)
            bacBtnOutlet.layer.shadowOpacity = 1    
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }



}
