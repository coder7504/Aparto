//
//  ViewController.swift
//  Aparto
//
//  Created by Mac user on 13/09/21.
//

import UIKit

class MyProfilePaymentViewController: UIViewController {
    
    @IBOutlet var borderViewCollect: [UIView]!
    @IBOutlet weak var moneyTextfield: UITextField! {
        didSet {
            moneyTextfield.delegate = self
        }
    }
    
    var paymentMethod: String = ""
    var methods: [String] = [
        "Payme",
        "Click",
        "Apelsin"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBorder()
        setDetails()
        addGesture()
    }
    
    func setBorder() {
        for i in borderViewCollect {
            i.layer.borderWidth = 2
            i.layer.borderColor = #colorLiteral(red: 0.7803921569, green: 0.7803921569, blue: 0.8, alpha: 1)
        }
    }
    
    func setDetails() {
        navigationItem.leftBarButtonItem?.tintColor = .black
        navigationItem.backButtonTitle = ""
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
    
    fileprivate
    func addGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        self.view.addGestureRecognizer(tap)
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        moneyTextfield.resignFirstResponder()
    }
    
    @IBAction func paymentMethodButtonsTapped(_ sender: UIButton) {
        for i in borderViewCollect {
            i.backgroundColor = .clear
        }
        paymentMethod = methods[sender.tag]
        borderViewCollect[sender.tag].backgroundColor = #colorLiteral(red: 0.7803921569, green: 0.7803921569, blue: 0.8, alpha: 1)
    }
    
    @IBAction func continueButtonTapped(_ sender: Any) {
        let vc = CurrentPaymentViewController(nibName: "CurrentPaymentViewController", bundle: nil)
        vc.currentSum = moneyTextfield.text ?? ""
        vc.payMethod = paymentMethod
        navigationController?.pushViewController(vc, animated: true)
    }
    
}



extension MyProfilePaymentViewController: UITextFieldDelegate {
    
}
