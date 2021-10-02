//
//  PropertyTypeForSaleViewController.swift
//  Aparto
//
//  Created by Mac user on 15/09/21.
//

import UIKit

class PropertyTypeForSaleViewController: UIViewController {

    
    @IBOutlet weak var residentalView: UIView! {
        didSet {
            residentalView.layer.borderColor = #colorLiteral(red: 0.9254901961, green: 0.9254901961, blue: 0.9254901961, alpha: 1)
            residentalView.layer.borderWidth = 1
        }
    }
    
    @IBOutlet weak var commericalView: UIView! {
        didSet {
            commericalView.layer.borderColor = #colorLiteral(red: 0.9254901961, green: 0.9254901961, blue: 0.9254901961, alpha: 1)
            commericalView.layer.borderWidth = 1
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.prefersLargeTitles = false
        setDetails()
   }
    
    func setDetails() {
        navigationItem.leftBarButtonItem?.tintColor = .black
        navigationItem.title = "Продать с Aparto"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(descriptor: UIFontDescriptor(name: "ProximaNova-Semibold", size: 16), size: 16)]
        setBackroundImageForNavigation()
    }
    
    func setBackroundImageForNavigation(){
        navigationController?.navigationBar.barTintColor = UIColor.white
        let img = UIImage(named: "navbar-background")
        navigationController?.navigationBar.setBackgroundImage(img, for: .default)
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.backButtonTitle = ""
        navigationItem.backBarButtonItem?.tintColor = .black
    }
    
    @IBAction func propertyTyeButtonTapped(_ sender: UIButton) {
        if sender.tag == 0 {
//            key
            
        } else {
//            contract
            
        }
        
        let vc = AdressForSaleViewController(nibName: "AdressForSaleViewController", bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
        
    }
    

}
