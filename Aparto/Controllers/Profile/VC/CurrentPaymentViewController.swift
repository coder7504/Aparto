//
//  CurrentPaymentViewController.swift
//  Aparto
//
//  Created by Mac user on 13/09/21.
//

import UIKit

class CurrentPaymentViewController: UIViewController {
    
    @IBOutlet weak var currentSumLabel: UILabel!
    @IBOutlet weak var paymentMethodLabel: UILabel!
    
    var payMethod : String = ""
    var currentSum : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabelTex()
        setDetails()
    }
    
    func setLabelTex() {
        currentSumLabel.text = currentSum
        paymentMethodLabel.text = payMethod
    }
    
    func setDetails() {
        navigationItem.leftBarButtonItem?.tintColor = .black
        navigationController?.navigationBar.tintColor = .black
        navigationItem.title = "Пополнение счета"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(descriptor: UIFontDescriptor(name: "ProximaNova-Semibold", size: 16), size: 16)]
        removeButtomLineNavigation()
        setBackroundImageForNavigation()
    }
    
    
    func setBackroundImageForNavigation(){
        navigationController?.navigationBar.tintColor = UIColor.black
        navigationController?.navigationBar.barTintColor = UIColor.white
        let img = UIImage(named: "navbar-background")
        navigationController?.navigationBar.setBackgroundImage(img, for: .default)
        navigationItem.largeTitleDisplayMode = .never
        
    }
    
    func removeButtomLineNavigation() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        self.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
    }
    
    
}
